resource "kubernetes_secret_v1" "my-web-app-credential" {
    metadata {
        name = "my-web-app-credential"
        namespace = "web-apps"
    }
    data = {
        "tls.key"= tls_private_key.webapp_key.private_key_pem,
        "tls.crt"= "${tls_locally_signed_cert.wabapp_cert.cert_pem}\n${data.aws_ssm_parameter.crtCa1.value}"
    }
}
