- include:
  - common.saltstack-repo

salt-master:
  pkg.installed:
    - require: saltstack-repo

/etc/salt/master:
  file.managed:
    - source: salt://salt-master/files/master
    - owner: root
    - group: root
    - mode: 0644