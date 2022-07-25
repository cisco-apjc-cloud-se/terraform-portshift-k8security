terraform {
  required_providers {
    securecn = {
      source = "Portshift/securecn"
      # version = "1.1.10"
    }
  }
  experiments = [module_variable_optional_attrs]
}

provider "securecn" {
  # Configuration options - supplied by Workspace variable set
  access_key = var.panoptica_access_key
  secret_key = var.panoptica_secret_key
  server_url = var.panoptica_server_url
}

resource "securecn_k8s_cluster" "k8s" {
  kubernetes_cluster_context                      = var.cluster.context
  name                                            = var.cluster.name

  api_intelligence_dast                           = var.cluster.api_intelligence_dast
  auto_labeling                                   = var.cluster.auto_labeling
  cd_pod_template                                 = var.cluster.cd_pod_template
  ci_image_validation                             = var.cluster.ci_image_validation
  connections_control                             = var.cluster.connections_control

  external_https_proxy                            = var.cluster.external_https_proxy
  fail_close                                      = var.cluster.fail_close
  hold_application_until_proxy_starts             = var.cluster.hold_application_until_proxy_starts
  inspect_incoming_cluster_connections            = var.cluster.inspect_incoming_cluster_connections

  istio_ingress_annotations                       = var.cluster.istio_ingress_annotations
  istio_ingress_enabled                           = var.cluster.istio_ingress_enabled
  istio_version                                   = var.cluster.istio_version
  minimum_replicas                                = var.cluster.minimum_replicas
  multi_cluster_communication_support             = var.cluster.multi_cluster_communication_support
  multi_cluster_communication_support_certs_path  = var.cluster.multi_cluster_communication_support_certs_path
  orchestration_type                              = var.cluster.orchestration_type
  persistent_storage                              = var.cluster.persistent_storage
  restrict_registries                             = var.cluster.restrict_registries
  service_discovery_isolation                     = var.cluster.service_discovery_isolation

  skip_ready_check                                = var.cluster.skip_ready_check
  spec_reconstruction                             = var.cluster.spec_reconstruction
  tls_inspection                                  = var.cluster.tls_inspection
  token_injection                                 = var.cluster.token_injection
  trace_analyzer                                  = var.cluster.trace_analyzer
  tracing_support                                 = var.cluster.tracing_support

  ## NOTE: Not included (yet) ##
  # external_ca (Block List, Max: 1) Use an external CA for this cluster (see below for nested schema)
  # id (String) The ID of this resource.
  # internal_registry (Block List, Max: 1) Use an internal container registry for this cluster (see below for nested schema)
  # sidecar_resources (Block List, Max: 1) Define resource limits for Istio sidecars (see below for nested schema)
}
