# Raaid's Cookiecutter Template

This is my first (and primary) [cookiecutter](https://cookiecutter.readthedocs.io/en/stable/) template for Python projects. It is opinionated. It uses:
- [Poetry](https://python-poetry.org/): Dependency management, (Project publishing to come? Might be too different project to project)
- [pre-commit](https://pre-commit.com/): Code style checks before git commits
- [Black](https://black.readthedocs.io/en/stable/): Code style
- [isort](https://pycqa.github.io/isort/): Import order
- [flake8](https://flake8.pycqa.org/en/latest/): Pep8 adherence
- [mypy](https://mypy.readthedocs.io/en/stable/): Static type checking
- [Docker](https://www.docker.com/): Containerize business logic
- [pytest](https://docs.pytest.org/en/7.2.x/): Testing
- [GitHub](https://github.com/): Version control and CI workflows (CD to come? Might be too different project to project)

See [this blog post](https://www.raaid.xyz/posts/tech/learning2) for more info on the pre-commit and code formatting tools.

## How to use this

[Follow instructions here to install cookiecutter.](https://cookiecutter.readthedocs.io/en/stable/installation.html#install-cookiecutter)

Then in the directory where you'd like a new Python project, run:

`> cookiecutter https://github.com/raaidarshad/cookiecutter-raaid`

Then follow the interactive prompts.