module "alerts" {
    source = "./module"

    project_id = "<Project_id>"
    email_address = ["<Email_address>"]
    region = "us-central1"

    cpu_enabled = 1
    t4_enabled = 0
    ip_threshold = 0.25
}