resource "google_container_cluster" "cluster" {
  name               = "${terraform.workspace}"
  zone               = "${var.zone}"
  initial_node_count = "${var.gcp_cluster_count}"
  master_auth {
    username = "${var.linux_admin_username}"
    password = "${var.linux_admin_password}}"
  }
  node_config {
    oauth_scopes = [
      "https://www.googleapis.com/auth/compute",
      "https://www.googleapis.com/auth/devstorage.read_only",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]
    labels {
      Environment = "${terraform.workspace}"
    }
    tags = ["${var.project_id}", "${terraform.workspace}"]
  }
}