resource "tls_private_key" "rootca" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "tls_self_signed_cert" "rootca" { 
  private_key_pem = tls_private_key.rootca.private_key_pem
  validity_period_hours =  3650  # Set your certificate validity (e.g., 10 years)

  subject {
    common_name = "Root CA"
    organization = "Istio"
    country = "US"
  }
   # Set the self-signed certificate as a root CA by marking it as a CA certificate
  is_ca_certificate = true
  
  allowed_uses = [   
    "key_encipherment",
    "digital_signature",   
    "cert_signing",
    "crl_signing"
  ]
}

output "rootca_certificate" {
  value = tls_self_signed_cert.rootca.cert_pem
}


