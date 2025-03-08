resource "helm_release" "web" {
name  = "web"
namespace   = "web-apps"
chart = "${path.module}/generic-chart"
version    = "1.0.4"

depends_on = [kubernetes_config_map.nginx_config]
}