resource "google_container_node_pool" "master" {
  name       = "master"
  cluster    = google_container_cluster.cluster-1.id
  node_count = 1

  management {
    auto_repair  = true
    auto_upgrade = true
  }
  autoscaling {
    min_node_count = 0
    max_node_count = 10
  }

  node_config {
    preemptible  = false
    machine_type = "e2-small"

    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}

