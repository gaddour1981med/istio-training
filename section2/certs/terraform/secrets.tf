resource "kubernetes_secret_v1" "ingress_cert" {
    metadata {
        name = "cacerts"
        namespace = "istio-system"
    }

    type = "Opaque" 

    data = {
        "ca-cert.pem" = aws_ssm_parameter.crtCa1.value,
        "ca-key.pem"  = aws_ssm_parameter.crtCa1PrivKey.value,
        "root-cert.pem" = aws_ssm_parameter.crtRoot.value,
        "cert-chain.pem" = aws_ssm_parameter.ca1Rootchain.value
    }
}

