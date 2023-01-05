FROM python:{{cookiecutter.python_version}}-slim as req
COPY pyproject.toml .
COPY poetry.lock .
RUN pip install poetry && poetry export -o requirements.txt

FROM python:{{cookiecutter.python_version}}-slim as builder
# run any updates and build dependencies here
# RUN apt-get update && apt-get install -y libpq-dev gcc
COPY --from=req requirements.txt .
RUN pip install --user -r requirements.txt

FROM python:{{cookiecutter.python_version}}-slim as runner
# run any updates and run dependencies here
# RUN apt-get update && apt-get install --no-install-recommends -y libpq-dev
COPY --from=builder /root/.local /root/.local
COPY /{{cookiecutter.project_slug}}/ /{{cookiecutter.project_slug}}/
ENV PATH=/root/.local/bin:$PATH
