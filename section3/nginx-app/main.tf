provider "aws"{
    region = var.region   
}

provider "kubernetes" {
  config_path = ".kube/config" # Adjust this path to your kubeconfig location
}

provider "helm" {
  kubernetes {
     config_path = ".kube/config" # Adjust this path to your kubeconfig location
  }
}



terraform {
    backend "s3"{
        bucket ="states-storage"
        key ="training/istio/app-web.tfstate"
        region = "eu-west-3"
    }
}
