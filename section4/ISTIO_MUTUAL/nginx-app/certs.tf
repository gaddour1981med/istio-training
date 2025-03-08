resource "tls_private_key" "webapp_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "tls_cert_request" "webapp_csr" { 
  private_key_pem = tls_private_key.webapp_key.private_key_pem

  dns_names = ["web.domain.com"]
  subject {   
    organization = "Training"
    country      = "US"
    common_name  ="web.domain.com"
  }
}


resource "tls_locally_signed_cert" "wabapp_cert" {
  cert_request_pem = tls_cert_request.webapp_csr.cert_request_pem 
  ca_private_key_pem = data.aws_ssm_parameter.crtCa1PrivKey.value
  ca_cert_pem = data.aws_ssm_parameter.crtCa1.value
  validity_period_hours = 8760  # 1 year

  allowed_uses = [
    "key_encipherment",
    "digital_signature"
  ]
}

output "webapp_certificate" {
  value = tls_locally_signed_cert.wabapp_cert.cert_pem
}


