resource "aws_ssm_parameter" "crtRoot"{
    name ="/tarining/istio/certs/root/crt"
    value = tls_self_signed_cert.rootca.cert_pem
    type = "String"
}

resource "aws_ssm_parameter" "crtRootPrivKey"{
     name ="/tarining/istio/certs/root/private_key"
    value = tls_private_key.rootca.private_key_pem
    type = "SecureString"
}


resource "aws_ssm_parameter" "crtCa1"{
    name ="/tarining/istio/certs/ca1/crt"
    value = tls_locally_signed_cert.subca1.cert_pem
    type = "String"
}

resource "aws_ssm_parameter" "crtCa1PrivKey"{
     name ="/tarining/istio/certs/ca1/private_key"
    value = tls_private_key.subca1.private_key_pem
    type = "SecureString"
}


resource "aws_ssm_parameter" "ca1Rootchain"{
    name ="/tarining/istio/certs/ca1/root_chain"
    value = "${tls_locally_signed_cert.subca1.cert_pem}\n${tls_self_signed_cert.rootca.cert_pem}"
    type = "String"
}

resource "aws_ssm_parameter" "crtCa2"{
    name ="/tarining/istio/certs/ca2/crt"
    value = tls_locally_signed_cert.subca2.cert_pem
    type = "String"
}

resource "aws_ssm_parameter" "crtCa2PrivKey"{
     name ="/tarining/istio/certs/ca2/private_key"
    value = tls_private_key.subca2.private_key_pem
    type = "SecureString"
}

