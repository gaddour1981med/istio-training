terraform{
    required_providers {
      aws ={
        source = "hashicorp/aws"
    }    
    helm = {
      source = "hashicorp/helm"
      version = "2.9.0"
    }  
    pkcs12 = {
      source = "chilicat/pkcs12"
      version = "0.2.5"
    }
}
}
