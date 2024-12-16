#!/bin/bash
# update tag
export VERSION=$(git rev-parse --short HEAD)

TAG=$VERSION docker compose build
TAG=$VERSION docker compose push

export TAG=${VERSION} 
echo $VERSION
echo $TAG
sed -i "s/\${TAG}/$TAG/g" ./personal-website/values.yaml

# helm install
sudo helm upgrade --install personal-website ./personal-website --namespace my-project --kubeconfig /home/ansyar/kubeconfig.yaml