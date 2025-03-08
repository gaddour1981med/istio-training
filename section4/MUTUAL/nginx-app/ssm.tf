data "aws_ssm_parameter" "crtRoot"{
    name ="/tarining/istio/certs/root/crt"
  
}

data "aws_ssm_parameter" "crtCa1"{
    name ="/tarining/istio/certs/ca1/crt"
}


data "aws_ssm_parameter" "crtCa1PrivKey"{
    name ="/tarining/istio/certs/ca1/private_key"  
}

