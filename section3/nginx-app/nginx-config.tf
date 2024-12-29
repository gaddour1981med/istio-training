resource "kubernetes_config_map" "nginx_config" {
  metadata {
    name      = "nginx-config"
    namespace = "web-apps"
  }

  data = {
    "default.conf" = file("${path.module}/default.conf")
  }
}