FROM demosdemon/pyenv

LABEL author="Matthew Tardiff <mattrix@gmail.com>"
LABEL maintainer="Brandon LeBlanc <brandon@leblanc.codes>"

RUN set -eux; \
    pyenv local 3.7.2; \
    python -m pip --no-cache-dir install pip==19.0.3; \
    python -m pip --no-cache-dir install tox==3.7.0 tox-pyenv==1.1.0; \
    pyenv local --unset; \
    pyenv rehash; \
    pyenv versions; \
    pip --version; \
    tox --version;
