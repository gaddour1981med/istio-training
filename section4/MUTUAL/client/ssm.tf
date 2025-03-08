data "aws_ssm_parameter" "crtRoot"{
    name ="/tarining/istio/certs/root/crt"
  
}

data "aws_ssm_parameter" "sub-ca2crt"{
     name ="/tarining/istio/certs/ca2/crt"   
}


data "aws_ssm_parameter" "sub-ca2PrivKey"{
     name ="/tarining/istio/certs/ca2/private_key"    
}
