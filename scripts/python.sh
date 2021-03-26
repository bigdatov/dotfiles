#!/bin/bash

curl https://pyenv.run | bash
curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python - --no-modify-path --yes
source $HOME/.poetry/env
export PATH="$HOME/.pyenv/bin:$PATH"
export PYENV_VERSION="pypy3.7-7.3.3"
pyenv install pypy3.7-7.3.3 && pyenv global pypy3.7-7.3.3 && python ensurepip --default-pip && python -m pip install -U pip flake8
export PYENV_VERSION="3.8.5"
pyenv install 3.8.5 && pyenv global 3.8.5 && python -m pip install -U pip black flake8 mypy
export PYENV_VERSION="3.9.0"
pyenv install 3.9.0 && pyenv global 3.9.0 && python -m pip install -U pip black flake8 mypy thefuck
poetry completions bash | sudo tee /etc/bash_completion.d/poetry.bash-completion
