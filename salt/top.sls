base:
  'centos*': #'*master|*minion':
    - common.kubernetes-repo
    - common.docker
    - common.basic

  'centos1': #'*master':
    - kubernetes-master

  'roles:mysql':
    - match: grain
    - data.mysql


