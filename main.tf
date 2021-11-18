module "alerts" {
    source = "./module"

    project_id = "<Project_id>"
    email_address = ["<Email_address>"]
    region = "us-central1"

    # Below are examples of how to turn on/off certain metrics and modify thresholds
    # cpu_enabled = 1
    # t4_enabled = 0
    # ip_threshold = 0.25
}