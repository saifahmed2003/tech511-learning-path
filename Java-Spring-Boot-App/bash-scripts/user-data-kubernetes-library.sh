#!/bin/bash
# ==========================================================
# Auto‑Deploy Library App + MySQL with seeded DB on Minikube
# ==========================================================
set -euxo pipefail

# 1️⃣  Update & install dependencies
apt-get update -y
apt-get install -y apt-transport-https ca-certificates curl git conntrack socat wget gnupg lsb-release docker.io

systemctl enable docker
systemctl start docker
usermod -aG docker ubuntu

# 2️⃣  Install kubectl & Minikube
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube_latest_amd64.deb
dpkg -i minikube_latest_amd64.deb

# 3️⃣  Clone your GitHub repo
cd /home/ubuntu
chown -R ubuntu:ubuntu /home/ubuntu
sudo -u ubuntu git clone https://github.com/saifahmed2003/library-java17-mysql-app.git
cd library-java17-mysql-app

# 4️⃣  Start Minikube
sudo -u ubuntu minikube start --driver=docker --force
sleep 60

# 5️⃣  Apply all Kubernetes manifests
cd /home/ubuntu/library-java17-mysql-app/k8s
sudo -u ubuntu kubectl apply -f .
sleep 150   # wait for pods

# 6️⃣  Background port‑forward 0.0.0.0:5000 → Service:5000
nohup sudo -u ubuntu kubectl port-forward service/library-app-service 5000:5000 --address=0.0.0.0 \
    > /home/ubuntu/portforward.log 2>&1 &

PUBLIC_IP=$(curl -s http://169.254.169.254/latest/meta-data/public-ipv4 || echo "0.0.0.0")
echo "✅ Deployment complete!  Visit:  http://${PUBLIC_IP}:5000/web/authors" | tee /home/ubuntu/READY.txt