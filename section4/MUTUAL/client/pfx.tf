resource "tls_private_key" "pfx_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "tls_cert_request" "pfx_csr" { 
  private_key_pem = tls_private_key.pfx_key.private_key_pem
  dns_names = ["client.domain.com"]
  subject {   
    organization = "domain.com"
    country      = "US"
    common_name  ="client.domain.com"
  }
}

resource "tls_locally_signed_cert" "pfx_cert" {
  cert_request_pem = tls_cert_request.pfx_csr.cert_request_pem 
  ca_private_key_pem = data.aws_ssm_parameter.sub-ca2PrivKey.value
  ca_cert_pem = data.aws_ssm_parameter.sub-ca2crt.value
  validity_period_hours = 8760  # 1 year

  allowed_uses = [
    "key_encipherment",
    "digital_signature"
  ]
}

resource "pkcs12_from_pem" "pfx_pkcs12" {
  password = "test"
  private_key_pem  = tls_private_key.pfx_key.private_key_pem  
  cert_pem = tls_locally_signed_cert.pfx_cert.cert_pem  
  ca_pem  = data.aws_ssm_parameter.sub-ca2crt.value
}


resource "local_file" "result" {
  filename = "./client-cert.p12"
  content_base64     = pkcs12_from_pem.pfx_pkcs12.result
}

