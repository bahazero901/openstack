- include:
  - common.redis
  - common.sensu-repo

senu-pkgs:
  pkg.installed:
    - pkgs:
      - sensu
      - uchiwa
  - require:
    - pkgrepo: sensu-repo

sensu-services:
  service.running:
    - names:
      - sensu-server
      - sensu-api
    - enable: True
    - require:
      - pkg: sensu-pkgs
    - watch:
      - file: /etc/sensu/conf.d/client.json
      - file: /etc/sensu/config.json
      - file: /etc/sensu/conf.d/transport.json
      - file: /etc/sensu/conf.d/api.json

/etc/sensu/config.json:
  file.managed:
    - source: salt://sensu/files/config.json
    - owner: sensu
    - group: sensu
    - template: jinja
    - mode: 644
    - require:
      - pkg: senu-pkgs

/etc/sensu/conf.d/api.json:
  file.managed:
    - source: salt://sensu/files/api.json
    - owner: sensu
    - group: sensu
    - template: jinja
    - mode: 644
    - require:
      - pkg: senu-pkgs

/etc/sensu/conf.d/transport.json:
  file.managed:
    - source: salt://sensu/files/transport.json
    - owner: sensu
    - group: sensu
    - template: jinja
    - mode: 644
    - require:
      - pkg: senu-pkgs

/etc/sensu/conf.d/redis.json:
  file.managed:
    - source: salt://sensu/files/redis.json
    - owner: sensu
    - group: sensu
    - template: jinja
    - mode: 644
    - require:
      - pkg: senu-pkgs

/etc/sensu/conf.d/client.json:
  file.managed:
    - source: salt://sensu/files/client.json
    - owner: sensu
    - group: sensu
    - template: jinja
    - mode: 644
    - require:
      - pkg: senu-pkgs

/etc/sensu/uchiwa.json:
  file.managed:
    - source: salt://sensu/files/uchiwa.json
    - owner: uchiwa
    - group: uchiwa
    - template: jinja
    - mode: 644
    - require:
      - pkg: senu-pkgs
