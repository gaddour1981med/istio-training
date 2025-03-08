provider "aws"{
    region = "eu-west-3"
}


terraform {
    backend "s3"{
        bucket ="states-storage"
        key ="training/istio/client.tfstate"
        region = "eu-west-3"
    }
}
