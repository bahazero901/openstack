###Used to store global variables and secrets for nodes

https://docs.saltstack.com/en/latest/topics/pillar/

/salt/master
pillar_roots:
  base:
    - /srv/pillar
    
    
grains are "facts" that salt pulls natively

####Refresh Grains
salt minion saltutil.refresh_modules

####Matching Grains
'node_type:webserver':
  - match: grain
  - webserver

'node_type:postgres':
  - match: grain
  - postgres

'node_type:redis':
  - match: grain
  - redis

'node_type:lb':
  - match: grain
  - lb