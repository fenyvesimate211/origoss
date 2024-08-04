provider "kubernetes" {
  config_path    = "~/.kube/config"
  config_context = "docker-desktop"
}

resource "kubernetes_manifest" "hello-world" {
  manifest = yamldecode(file("${path.module}/deployment.yaml"))
}