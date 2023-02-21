resource "google_container_cluster" "cluster-1" {
  name                     = "cluster-1"
  location                 = "europe-west1-b"
  remove_default_node_pool = true
  initial_node_count       = 1
  network                  = google_compute_network.my-vpc.self_link
  subnetwork               = google_compute_subnetwork.private-subnet.self_link
  networking_mode          = "VPC_NATIVE"

  node_locations = [
    "europe-west1-c"
  ]
helm repo add ingress-nginx \ https://kubernetes.github.io/ingress-nginx
  addons_config {
    http_load_balancing {
      disabled = true
    }
    horizontal_pod_autoscaling {
      disabled = false
    }
  }

  release_channel {
    channel = "REGULAR"
  }

  ip_allocation_policy {
    cluster_secondary_range_name  = "gke-cluster-1-pods-range"
    services_secondary_range_name = "gke-cluster-1-service-range"
  }

  private_cluster_config {
    enable_private_nodes    = true
    enable_private_endpoint = false
    master_ipv4_cidr_block  = "172.16.0.0/28"
  }
}
