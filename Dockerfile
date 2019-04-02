FROM redis:alpine

COPY docker-entrypoint.sh /usr/bin/

ENTRYPOINT docker-entrypoint.sh
