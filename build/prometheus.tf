variable chart_version {
  type        = string
  default     = ""
}

variable KUBERNETES_MASTER {
  type = string
  default = ""
}


# module "kube_prometheus_stack_crds" {
#     source = "rpadovani/helm-crds/kubectl"
#     version = "0.3.0"

#     crds_urls = [
#         "https://raw.githubusercontent.com/prometheus-community/helm-charts/kube-prometheus-stack-${var.chart_version}/charts/kube-prometheus-stack/crds/crd-alertmanagerconfigs.yaml",
#         "https://raw.githubusercontent.com/prometheus-community/helm-charts/kube-prometheus-stack-${var.chart_version}/charts/kube-prometheus-stack/crds/crd-alertmanagers.yaml",
#         "https://raw.githubusercontent.com/prometheus-community/helm-charts/kube-prometheus-stack-${var.chart_version}/charts/kube-prometheus-stack/crds/crd-podmonitors.yaml",
#         "https://raw.githubusercontent.com/prometheus-community/helm-charts/kube-prometheus-stack-${var.chart_version}/charts/kube-prometheus-stack/crds/crd-probes.yaml",
#         "https://raw.githubusercontent.com/prometheus-community/helm-charts/kube-prometheus-stack-${var.chart_version}/charts/kube-prometheus-stack/crds/crd-prometheuses.yaml",
#         "https://raw.githubusercontent.com/prometheus-community/helm-charts/kube-prometheus-stack-${var.chart_version}/charts/kube-prometheus-stack/crds/crd-prometheusrules.yaml",
#         "https://raw.githubusercontent.com/prometheus-community/helm-charts/kube-prometheus-stack-${var.chart_version}/charts/kube-prometheus-stack/crds/crd-servicemonitors.yaml",
#         "https://raw.githubusercontent.com/prometheus-community/helm-charts/kube-prometheus-stack-${var.chart_version}/charts/kube-prometheus-stack/crds/crd-thanosrulers.yaml",
#     ]
# }

resource "helm_release" "kube_prometheus_stack" {
  name       = "kube-prometheus-stack"
  repository = "https://prometheus-community.github.io/helm-charts"
  chart      = "kube-prometheus-stack"
  version    = "${var.chart_version}" # <- With this, we keep in sync Helm Chart and CRDs

  skip_crds = true # Optional, given that they should be skipped if they are already present

  # depends_on = [module.kube_prometheus_stack_crds]
}