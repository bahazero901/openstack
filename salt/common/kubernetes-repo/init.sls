kubernetes-repo:
  pkgrepo.managed:
    - name: Kubernetes
    - humanname: Kubernetes Yum Repo
    - enabled: True
    - baseurl: https://packages.cloud.google.com/yum/repos/kubernetes-el7-x86_64
    - gpgcheck: 1
    - gpgkey:
      - https://packages.cloud.google.com/yum/doc/yum-key.gpg
      - https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg

