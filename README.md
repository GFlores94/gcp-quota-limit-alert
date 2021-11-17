# gcp-quota-limit-alert
Terraform template for creating Google Cloud alerts for project quota limits

All metrics are enabled by default with a threshold of 75% for alerts.
You can disable metrics and modify the threshold by changing {metric_name}_enabled and {metric_name}_threshold.
Examples can be found in the parent directory's main.tf, metric variables can be found in module/var.tf

