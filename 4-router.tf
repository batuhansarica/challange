resource "google_compute_router" "my-vpc-router" {
  name    = "my-vpc-router"
  region  = "europe-west1"
  network = google_compute_network.my-vpc.id
}
