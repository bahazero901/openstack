- include:
  - common.saltstack-repo

salt-minion:
  pkg.installed:
    - require: saltstack-repo

/etc/salt/minion:
  file.managed:
    - source: salt://salt-master/files/minion
    - owner: root
    - group: root
    - mode: 0644