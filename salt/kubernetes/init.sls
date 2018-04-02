###Master Ports
#TCP	Inbound	6443*	Kubernetes API server
#TCP	Inbound	2379-2380	etcd server client API
#TCP	Inbound	10250	Kubelet API
#TCP	Inbound	10251	kube-scheduler
#TCP	Inbound	10252	kube-controller-manager
#TCP	Inbound	10255	Read-only Kubelet API

- require:
  - common.kubernetes-repo
  - common.docker

disable_swap:
  cmd.run:
    - name: sed -i '/ swap / s/^/#/' /etc/fstab
  cmd.run:
    - name: swapoff -a

yum-update:
  pkg.update:
    - name: *

docker-services:
  service.running:
    - enable: True
    - require:
      - pkg: docker-pkgs

kubernetes-pkgs:
  pkg.installed:
    - names:
      - kubelet
      - kubeadm
      - kubectl
    - require:
      - pkgrepo: kubernetes-repo
      - pkg: yum-update

kubernetes-services:
  service.running:
    - name:
      - kubelet
    - require:
      - kubernetes-pkgs

disable_selinux:
  permissive:
    selinux.mode

corrects-routing:
  cmd.run:
    - name:
cat <<EOF >  /etc/sysctl.d/k8s.conf
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
EOF
sysctl --system




#master
#need to initialize kubernetes - #kubeadm init --apiserver-advertise-address 192.168.100.211
#install calico  kubectl apply -f https://docs.projectcalico.org/v3.0/getting-started/kubernetes/installation/hosted/kubeadm/1.7/calico.yaml
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config


sudo kubeadm init --pod-network-cidr=10.244.0.0/16

