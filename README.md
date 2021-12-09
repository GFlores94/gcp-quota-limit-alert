# gcp-quota-limit-alert
Terraform template for creating Google Cloud alerts for project quota limits

All metrics are enabled by default with a threshold of 75% for alerts.  
You can disable metrics and modify the threshold by changing {metric_name}_enabled and {metric_name}_threshold.  
Examples can be found in the parent directory's main.tf, metric variables can be found in module/var.tf.  

As of Dec 9, 2021 these resources are free since the `quota/allocation/usage` metrics are labeled [Google Cloud metrics](https://cloud.google.com/monitoring/api/metrics_gcp) and Google Cloud metrics [incur no cost](https://cloud.google.com/stackdriver/pricing#monitoring-costs).

## How to use
The module was written in Terraform v1.0.10 therefore it's recommended to use the same version or newer for syntax compatibility.

If you're unfamiliar with Terraform please follow this guide and return once you have it setup:  
https://www.terraform.io/intro/index.html  

Once setup you'll need to modify project_id, and email_address in the root main.tf file.  
If you are not using us-central1 as your region you will need to change that too.  

> The terraform backend configuration in main.tf is optional. If you provide an existing bucket name it'll create your Terraform state file in a remote location. This is ideal for production and collaboration. For proof of concept work you can comment out this configuration.

Once modified run  
`terraform init`

After successfully initializing run  
`terraform plan`

To see all the resources created.
Finally, run  
`terraform apply`

It will prompt you for a 'yes' response in order to provision the resources.

If you would like to delete all provisioned resources, run  
`terraform destroy`

This will also prompt you for a 'yes' in order to delete the infrustructure.