FROM demosdemon/pyenv

LABEL author="Matthew Tardiff <mattrix@gmail.com>"
LABEL maintainer="Brandon LeBlanc <brandon@leblanc.codes>"

RUN set -eux; \
    groupadd -r tox --gid=999; \
    useradd -m -r -g tox --uid=999 tox;

# Install gosu to run tox as the "tox" user instead of as root.
# https://github.com/tianon/gosu#from-debian
RUN set -eux; \
    apt-get update; \
    apt-get install --no-install-recommends -y gosu; \
    apt-get clean; rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*;

RUN set -eux; \
    pyenv local 3.7.2; \
    python -m pip --no-cache-dir install pip==19.0.3; \
    python -m pip --no-cache-dir install tox==3.7.0 tox-pyenv==1.1.0; \
    pyenv local --unset; \
    pyenv rehash;

WORKDIR /app
VOLUME /src

COPY docker-entrypoint.sh /

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["tox"]
