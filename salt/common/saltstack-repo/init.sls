saltstack-repo:
  pkgrepo.managed:
    - name: saltstack-repo
    - humanname: SaltStack repo for Red Hat Enterprise Linux $releasever
    - enabled: True
    - baseurl: https://repo.saltstack.com/yum/redhat/$releasever/$basearch/latest
    - gpgcheck: 1
    - gpgkey:
      - https://repo.saltstack.com/yum/redhat/$releasever/$basearch/latest/SALTSTACK-GPG-KEY.pub
      - https://repo.saltstack.com/yum/redhat/$releasever/$basearch/latest/base/RPM-GPG-KEY-CentOS-7

