FROM redis:alpine

RUN delgroup redis && deluser redis && addgroup -g 2002 redis && adduser -u 2002 -G redis -h /home/redis -D -s /sbin/nologin redis

CMD ["redis-server"]
