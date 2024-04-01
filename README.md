# DjangoEzLint

DjangoEzLint is an all in one linting & formatting tool for Django.
It allows you to keep your code clean and ensure your Django project
is in line with PEP 8 standards, by leveraging libraries such as:

- black
- autopep8
- autoflake
- isort
- flake8

on the python side and:

- prettier

on the frontend. EzLint will automatically know which linting tools to run based on the file extension.

Ensure you have all dependencies installed in your environment.
Run:
```bash
make install
```
if you are missing any.

DjangoEzLint currently works as a bash script. To use, clone the repository (using https):
```bash
git clone https://github.com/Nathanlewis99/DjangoEzLint.git
```
and create symlinks to the scripts:

```bash
ln -s /location/to/DjangoEzLint/linter/linter.bash linter
lm -s /location/to/DjangoEzLint/linter/Ezlint.bash Ezlint
```
You may need to add the location to your path. You can then run Ezlint on your
django project using:
```bash
Ezlint <directory or filename>
```
