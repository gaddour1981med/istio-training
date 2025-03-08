provider "aws"{
    region = "eu-west-3"  
}

provider "kubernetes" {
  config_path = ".kube/config" # Adjust this path to your kubeconfig location
}

provider "helm" {
  kubernetes {
     config_path = ".kube/config" # Adjust this path to your kubeconfig location
  }
}

provider "tls" {
  # TLS provider is used for generating private keys and certificates
}

terraform {
    backend "s3"{
        bucket ="states-storage"
        key ="training/istio/app-web.tfstate"
        region = "eu-west-3"
    }
}
