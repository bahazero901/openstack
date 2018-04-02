- include:
  - common.rabbitmq
  - common.reddis

sensu-repo:
  pkgrepo.manage:
    - humanname: sensu
    - mirror: https://sensu.global.ssl.fastly.net/yum/$releasever/$basearch/
    - gpgcheck: 0
    - enabled: True

sensu-client:
  pkg.installed:
    - name: sensu
    - require:
      - pkgrepo: sensu-repo

sensu-client:
  service.running:
    - enable: True
    - watch:
      - file: /etc/sensu/conf.d/client.json
      - file: /etc/sensu/conf.d/transport.json
      - file: /etc/sensu/conf.d/redis.json

{% for DIR in ['/etc/sensu/conf.d/client.json','/etc/sensu/conf.d/transport.json','/etc/sensu/conf.d/redis.json'] %}
{{ DIR }}:
  file.managed:
    source: salt://sensu-client/client.json
    owner: sensu
    group: sensu
    mode: 644
    template: jinja
{% endfor %}



