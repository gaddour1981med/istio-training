resource "tls_private_key" "subca1" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "tls_cert_request" "subca1" { 
  private_key_pem = tls_private_key.subca1.private_key_pem

  subject {
    common_name  = "Sub root CA1"
    organization = "Istio"
    country      = "US"
  }
}

resource "tls_locally_signed_cert" "subca1" {
  cert_request_pem = tls_cert_request.subca1.cert_request_pem 
  ca_private_key_pem = tls_private_key.rootca.private_key_pem
  ca_cert_pem = tls_self_signed_cert.rootca.cert_pem

  validity_period_hours = 8760  # 1 year

  is_ca_certificate = true

  allowed_uses = [
   "key_encipherment",
    "digital_signature",   
    "cert_signing",
    "crl_signing"
  ]
}

output "subca1_certificate" {
  value = tls_locally_signed_cert.subca1.cert_pem
}


