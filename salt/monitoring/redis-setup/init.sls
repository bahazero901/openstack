- include:
  - common.redis

redis-services:
  service.running:
    - names:
      - redis
      - redis-sentinel
    - reqiure:
      - pkg: redis-pkgs
    - watch:
      - file: /etc/redis/redis.conf

#need to modify ulimit to 65536
/etc/redis/redis.conf:
  file.managed:
    - source: salt://monitoring/redis-setup/files/redis.conf
    - user: redis
    - group: redis
    - template: jinja
    - require:
      - pkg: redis-pkgs
