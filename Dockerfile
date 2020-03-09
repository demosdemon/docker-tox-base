FROM demosdemon/pyenv

LABEL author="Matthew Tardiff <mattrix@gmail.com>"
LABEL maintainer="Brandon LeBlanc <brandon@leblanc.codes>"

RUN set -eux; \
    for version in $(< $PYENV_ROOT/version); do \
        pyenv local $version; \
        python -m pip --no-cache-dir install pip==20.0.2; \
        python -m pip --no-cache-dir install tox==3.14.5 tox-pyenv==1.1.0; \
        pip --version; \
        tox --version; \
        pyenv local --unset; \
        pyenv rehash; \
    done; \
    pyenv versions;
