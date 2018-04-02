pike:
  pkg.installed:
    - name: centos-release-openstack-pike

#upgrade?
pkg.latest:
  - name: *
  - require:
    - pkg: pike

openstack-pkgs:
  pkg.installed:
    - names:
      - python-openstackclient
      - openstack-selinux
    - require:
      - pkg: pike

