- include:
  - common.epel

redis-pkgs:
  pkg.installed:
    - name: redis
    - require:
      - pkg: epel

