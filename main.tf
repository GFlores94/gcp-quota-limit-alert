module "alerts" {
    source = "./module"

    project_id = "sandbox-gpflores"
    email_address = ["gpflores@google.com","luisruano@google.com"]
    region = "us-central1"
}