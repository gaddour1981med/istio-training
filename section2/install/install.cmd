#create istio-system namespace
kubcetl create namespace istio-system

# download sitio version 1.15.7
curl -L https://istio.io/downloadIstio | ISTIO_VERSION=1.15.7 sh -
cd istio-1.15.7
export PATH=$PWD/bin:$PATH
istioctl install --set profile=demo