sensu-repo:
  pkgrepo.manage:
    - humanname: sensu
    - mirror: https://sensu.global.ssl.fastly.net/yum/$releasever/$basearch/
    - gpgcheck: 0
    - enable: True