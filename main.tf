provider "kubernetes" {
  config_path    = "~/.kube/config"
  config_context = "arn:aws:eks:eu-central-1:992382520692:cluster/origoss-cluster"
}

resource "kubernetes_manifest" "hello-world" {
  manifest = yamldecode(file("${path.module}/deployment.yaml"))
}