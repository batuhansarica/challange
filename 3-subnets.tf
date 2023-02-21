resource "google_compute_subnetwork" "private-subnet" {
  name                     = "private-subnet"
  ip_cidr_range            = "10.10.1.0/24"
  region                   = "europe-west1"
  network                  = google_compute_network.my-vpc.id
  private_ip_google_access = true

  secondary_ip_range {
    range_name    = "gke-cluster-1-pods-range"
    ip_cidr_range = "10.252.0.0/14"
  }
  secondary_ip_range {
    range_name    = "gke-cluster-1-service-range"
    ip_cidr_range = "10.0.0.0/20"
  }
}
