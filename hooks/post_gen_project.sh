#!/usr/bin/env bash

# make sure python version is present and available
pyenv install --skip-existing {{ cookiecutter.python_version }}
pyenv local {{ cookiecutter.python_version }}

{% if cookiecutter.create_dockerfile == 'false' %}
rm Dockerfile
{% endif %}


{% if cookiecutter.create_pypi_publish_action == 'false' %}
rm .github/workflows/on-merge-to-main.yaml
{% endif %}

# create virtual environment, install dependencies, and create lock file
{% if cookiecutter.create_venv == 'true' %}
echo "Creating virtual environment and installing dependencies..."
poetry config virtualenvs.create true --local
poetry config virtualenvs.in-project true --local
poetry install
echo "Virtual environment created."
echo "Dependencies installed."
{% endif %}

{% if cookiecutter.init_git == 'true' %}
# initialize git with "main" branch instead of "master"
echo "Initializing git..."
git init && git checkout -b main
echo "Git initialized."


# activate virtual environment, install pre-commit, deactivate virtual environment
echo "Installing pre-commit..."
source $(poetry env list --full-path)/bin/activate && pre-commit install && deactivate
echo "Pre-commit installed."

# create a new gh repo and push the project up to the remote
echo "Making first git commit..."
git add . && git commit -m "initial commit"
echo "First commit made."

# not sure if there's a simpler way to do this, but ask for private/public repo option
while true; do
    read -p "Make the repo private? ([y]/n) " yn
    case $yn in
        [Yy]* ) private_flag="--private"; break;;
        [Nn]* ) private_flag="--public"; break;;
        * ) echo "Defaulting to private."; private_flag="--private"; break;;
    esac
done

# use github cli to create and push project
echo "Creating repository on GitHub..."
gh repo create '{{ cookiecutter.github_owner }}/{{ cookiecutter.project_name }}' --source=. $private_flag --description "$proj_description" --push
echo "GitHub repository created."

echo "All done! Happy coding =)"
{% endif %}
