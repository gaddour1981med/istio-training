terraform{
    required_providers {
      aws ={
        source = "hashicorp/aws"
    }  
    pkcs12 = {
      source = "chilicat/pkcs12"
      version = "0.2.5"
    }
}
}
