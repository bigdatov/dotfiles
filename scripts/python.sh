#!/bin/bash

curl https://pyenv.run | bash
curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python - --no-modify-path --yes
source $HOME/.poetry/env

pyenv install pypy3.7-7.3.3 && pyenv global pypy3.7-7.3.3 && python ensurepip --default-pip && pip install -U pip flake8
pyenv install 3.8.5 && pyenv global 3.8.5 && pip install -U pip black flake8 mypy
pyenv install 3.9.0 && pyenv global 3.9.0 && pip install -U pip black flake8 mypy

poetry completions bash | sudo tee /etc/bash_completion.d/poetry.bash-completion
