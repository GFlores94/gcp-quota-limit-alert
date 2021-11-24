module "alerts" {
    source = "./module"

    project_id = "<project_id>"
    email_address = ["<email_address>"]
    region = "us-central1"

    # Below are examples of how to turn on/off certain metrics and modify thresholds
    # cpu_enabled = 1
    # t4_enabled = 0
    # ip_threshold = 0.25
}

terraform {
  backend "gcs" {
    bucket  = "<bucket_name>"
    prefix  = "terraform/state"
  }
}