FROM demosdemon/pyenv

LABEL author="Matthew Tardiff <mattrix@gmail.com>"
LABEL maintainer="Brandon LeBlanc <brandon@leblanc.codes>"

RUN set -eux; \
    groupadd -r tox --gid=999; \
    useradd -m -r -g tox --uid=999 tox;

ENV PYENV_VERSION="3.7.2"

ENV PYTHON_PIP_VERSION="19.0.3"
RUN python -m pip --no-cache-dir install pip==$PYTHON_PIP_VERSION

ENV PYTHON_TOX_VERSION="3.7.0"
ENV PYTHON_TOX_PYENV_VERSION="1.1.0"
RUN python -m pip --no-cache-dir install tox==$PYTHON_TOX_VERSION tox-pyenv==$PYTHON_TOX_PYENV_VERSION
