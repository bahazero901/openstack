base:
  '*':
    - openstack.keystone
    - openstack.glance
    - openstack.cinder
    - openstack.nova
    - openstack.rabbitmq
    - openstack.horizon
    - sensu.redis

  '*master':
    - salt.salt-master

  '*minion':
    - salt.salt-minion

  'roles:mysql':
    - match: grain
    - data.mysql

