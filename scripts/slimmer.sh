#!/bin/bash

sudo ./docker-slim build \
--continue-after 10 \
--include-path /var/lib/nginx/tmp/ \
--mount $SAVE/scripts:/scripts \
--mount ${SAVE}/nginx:/etc/nginx \
--entrypoint /scripts/libinclude.sh \
--http-probe \
ubungxctr


