FROM demosdemon/pyenv

LABEL author="Matthew Tardiff <mattrix@gmail.com>"
LABEL maintainer="Brandon LeBlanc <brandon@leblanc.codes>"

RUN set -eux; \
    pyenv local 3.8.1; \
    python -m pip --no-cache-dir install pip==20.0.2; \
    python -m pip --no-cache-dir install tox==3.14.5 tox-pyenv==1.1.0; \
    pyenv local --unset; \
    pyenv rehash; \
    pyenv versions; \
    pip --version; \
    tox --version;
