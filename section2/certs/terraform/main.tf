provider "aws"{
    region = "eu-west-3" 
}

provider "tls" {
  # TLS provider is used for generating private keys and certificates
}

provider "kubernetes" {
  config_path = ".kube/config" # Adjust this path to your kubeconfig location
}



terraform {
    backend "s3"{
        bucket ="states-storage"
        key ="training/istio/certs.tfstate"
        region = "eu-west-3"
}
}
