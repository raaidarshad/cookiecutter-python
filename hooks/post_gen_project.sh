# create virtual environment, install dependencies, and create lock file
{% if cookiecutter.venv %}
echo "Creating virtual environment and installing dependencies..."
cd '{{ cookiecutter.project_name }}' && poetry install
echo "Virtual environment created."
echo "Dependencies installed."
{% endif %}

{% if cookiecutter.git %}
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
gh repo create '{{ cookiecutter.project_name }}' --source=. $private_flag --description "$proj_description" --push
echo "GitHub repository created."

echo "All done! Happy coding =)"
{% endif %}