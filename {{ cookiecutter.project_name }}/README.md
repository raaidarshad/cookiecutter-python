# {{cookiecutter.project_name}}

<!-- [![Release](https://img.shields.io/github/v/release/{{cookiecutter.github_owner}}/{{cookiecutter.project_name}})](https://img.shields.io/github/v/release/{{cookiecutter.github_owner}}/{{cookiecutter.project_name}}) -->
<!-- [![Build status](https://img.shields.io/github/workflow/status/{{cookiecutter.github_owner}}/{{cookiecutter.project_name}}/merge-to-main)](https://img.shields.io/github/workflow/status/{{cookiecutter.github_owner}}/{{cookiecutter.project_name}}/merge-to-main) -->

[![Python version](https://img.shields.io/badge/python_version-{{cookiecutter.python_version|truncate(4,True,'', 0)}}-blue)](https://github.com/psf/black)
[![Lint with Ruff](https://img.shields.io/badge/style-ruff-41B5BE?style=flat)](https://docs.astral.sh/ruff/)
[![Type checking with mypy](https://img.shields.io/badge/type_checker-mypy-blue)](https://mypy.readthedocs.io)
[![License](https://img.shields.io/github/license/{{cookiecutter.github_owner}}/{{cookiecutter.project_name}})](https://img.shields.io/github/license/{{cookiecutter.github_owner}}/{{cookiecutter.project_name}})

{{cookiecutter.project_description}}

## Usage

TODO: Describe how to use your project!
TODO: Do you need an installation, contributing, community, documentation, or other section here?
Depends on the project, make sure to add it if it makes sense to do so.

## Development

This project uses [uv](https://docs.astral.sh/uv/) to manage dependencies. It also helps with pinning dependency and python
versions. We also use [pre-commit](https://pre-commit.com/) with a hook for ruff for consistent code style and
readability. Note that this means code that doesn't meet the rules will fail to commit until it is fixed.

We use [mypy](https://mypy.readthedocs.io/en/stable/index.html) for static type checking. This can be run [manually](#run-static-type-checking),
and the CI runs it on PRs to the `main` branch. We also use [pytest](https://docs.pytest.org/en/8.3.x/) to run our tests.
This can be run [manually](#run-tests) and the CI runs it on PRs to the `main` branch.

### Setup

1. [Install uv](https://docs.astral.sh/uv/getting-started/installation/).
2. Run `uv sync` to make sure the lock file is present, the virtual environment is created, and dependencies are installed
3. Run `source .venv/bin/activate && pre-commit install && deactivate` to set up `pre-commit`

You're all set up! Your local environment should include all dependencies, including dev dependencies.

### Run Code Format and Linting

To manually run Ruff simply run `ruff check .` for linting and `ruff format .` for formatting.

### Run Static Type Checking

To manually run mypy, simply run `mypy` from the root directory of the project. It will use the default configuration
specified in `pyproject.toml`.

### Update Dependencies

To update dependencies in your local environment, consult the [uv docs](https://docs.astral.sh/uv/concepts/projects/dependencies/).

### Run Tests

To manually run rests, simply run `uv run pytest tests` from the root directory of the project. Explore the `pytest` docs (linked above)
to see more options.
