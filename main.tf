provider "google" {
  project = "<PROJECTID>"
  region = "us-central1"
}

resource "google_monitoring_alert_policy" "CPU_quota_check" { //Works for all region by default
  display_name = "CPU utilization approaching project quota"
  combiner     = "OR"
  conditions {
    display_name = "CPU utilization approaching project quota"
    condition_monitoring_query_language {
      query = <<EOT
      fetch consumer_quota
| filter resource.service == 'compute.googleapis.com'
| { metric serviceruntime.googleapis.com/quota/allocation/usage
    | align next_older(1d)
    | group_by [resource.project_id, metric.quota_metric, resource.location],
        max(val())
  ; metric serviceruntime.googleapis.com/quota/limit
    | filter metric.limit_name == 'CPUS-per-project-region'
    | align next_older(1d)
    | group_by [resource.project_id, metric.quota_metric, resource.location],
        min(val())
  }
| ratio
| every 1m
| condition gt(val(), 0.75 '1')
EOT
      duration = "60s"
    }
  }

  notification_channels = ["${google_monitoring_notification_channel.basic.name}"]
}

resource "google_monitoring_alert_policy" "SSD_quota_check" { //Works for all region by default
  display_name = "SSD Persistent Disk utilization approaching project quota"
  combiner     = "OR"
  conditions {
    display_name = "SSD Persistent Disk utilization approaching project quota"
    condition_monitoring_query_language {
      query = <<EOT
      fetch consumer_quota
| filter resource.service == 'compute.googleapis.com'
| { metric serviceruntime.googleapis.com/quota/allocation/usage
    | align next_older(1d)
    | group_by [resource.project_id, metric.quota_metric, resource.location],
        max(val())
  ; metric serviceruntime.googleapis.com/quota/limit
    | filter metric.limit_name == 'SSD-TOTAL-GB-per-project-region'
    | align next_older(1d)
    | group_by [resource.project_id, metric.quota_metric, resource.location],
        min(val())
  }
| ratio
| every 1m
| condition gt(val(), 0.75 '1')
EOT
      duration = "60s"
    }
  }

  notification_channels = ["${google_monitoring_notification_channel.basic.name}"]
}

resource "google_monitoring_alert_policy" "IP_usage_quota" { //Works for all region by default
  display_name = "IP utilization approaching project quota"
  combiner     = "OR"
  conditions {
    display_name = "IP utilization approaching project quota"
    condition_monitoring_query_language {
      query = <<EOT
      fetch consumer_quota
| filter resource.service == 'compute.googleapis.com'
| { metric serviceruntime.googleapis.com/quota/allocation/usage
    | align next_older(1d)
    | group_by [resource.project_id, metric.quota_metric, resource.location],
        max(val())
  ; metric serviceruntime.googleapis.com/quota/limit
    | filter metric.limit_name == 'IN-USE-ADDRESSES-per-project-region'
    | align next_older(1d)
    | group_by [resource.project_id, metric.quota_metric, resource.location],
        min(val())
  }
| ratio
| every 1m
| condition gt(val(), 0.75 '1')
EOT
      duration = "60s"
    }
  }

  notification_channels = ["${google_monitoring_notification_channel.basic.name}"]
}

resource "google_monitoring_alert_policy" "P4_usage_quota" { //Works for all region by default
  display_name = "NVIDIA P4 GPU utilization approaching project quota"
  combiner     = "OR"
  conditions {
    display_name = "NVIDIA P4 GPU utilization approaching project quota"
    condition_monitoring_query_language {
      query = <<EOT
      fetch consumer_quota
| filter resource.service == 'compute.googleapis.com'
| { metric serviceruntime.googleapis.com/quota/allocation/usage
    | align next_older(1d)
    | group_by [resource.project_id, metric.quota_metric, resource.location],
        max(val())
  ; metric serviceruntime.googleapis.com/quota/limit
    | filter metric.limit_name == 'NVIDIA-P4-GPUS-per-project-region'
    | align next_older(1d)
    | group_by [resource.project_id, metric.quota_metric, resource.location],
        min(val())
  }
| ratio
| every 1m
| condition gt(val(), 0.75 '1')
EOT
      duration = "60s"
    }
  }

  notification_channels = ["${google_monitoring_notification_channel.basic.name}"]
}

resource "google_monitoring_alert_policy" "T4_usage_quota" { //Works for all region by default
  display_name = "NVIDIA T4 GPU utilization approaching project quota"
  combiner     = "OR"
  conditions {
    display_name = "NVIDIA T4 GPU utilization approaching project quota"
    condition_monitoring_query_language {
      query = <<EOT
      fetch consumer_quota
| filter resource.service == 'compute.googleapis.com'
| { metric serviceruntime.googleapis.com/quota/allocation/usage
    | align next_older(1d)
    | group_by [resource.project_id, metric.quota_metric, resource.location],
        max(val())
  ; metric serviceruntime.googleapis.com/quota/limit
    | filter metric.limit_name == 'NVIDIA-T4-GPUS-per-project-region'
    | align next_older(1d)
    | group_by [resource.project_id, metric.quota_metric, resource.location],
        min(val())
  }
| ratio
| every 1m
| condition gt(val(), 0.75 '1')
EOT
      duration = "60s"
    }
  }

  notification_channels = ["${google_monitoring_notification_channel.basic.name}"]
}

resource "google_monitoring_alert_policy" "K80_usage_quota" { //Works for all region by default
  display_name = "NVIDIA K80 GPU utilization approaching project quota"
  combiner     = "OR"
  conditions {
    display_name = "NVIDIA K80 GPU utilization approaching project quota"
    condition_monitoring_query_language {
      query = <<EOT
      fetch consumer_quota
| filter resource.service == 'compute.googleapis.com'
| { metric serviceruntime.googleapis.com/quota/allocation/usage
    | align next_older(1d)
    | group_by [resource.project_id, metric.quota_metric, resource.location],
        max(val())
  ; metric serviceruntime.googleapis.com/quota/limit
    | filter metric.limit_name == 'NVIDIA-K80-GPUS-per-project-region'
    | align next_older(1d)
    | group_by [resource.project_id, metric.quota_metric, resource.location],
        min(val())
  }
| ratio
| every 1m
| condition gt(val(), 0.75 '1')
EOT
      duration = "60s"
    }
  }

  notification_channels = ["${google_monitoring_notification_channel.basic.name}"]
}

resource "google_monitoring_alert_policy" "V100_usage_quota" { //Works for all region by default
  display_name = "NVIDIA V100 GPU utilization approaching project quota"
  combiner     = "OR"
  conditions {
    display_name = "NVIDIA V100 GPU utilization approaching project quota"
    condition_monitoring_query_language {
      query = <<EOT
      fetch consumer_quota
| filter resource.service == 'compute.googleapis.com'
| { metric serviceruntime.googleapis.com/quota/allocation/usage
    | align next_older(1d)
    | group_by [resource.project_id, metric.quota_metric, resource.location],
        max(val())
  ; metric serviceruntime.googleapis.com/quota/limit
    | filter metric.limit_name == 'NVIDIA-V100-GPUS-per-project-region'
    | align next_older(1d)
    | group_by [resource.project_id, metric.quota_metric, resource.location],
        min(val())
  }
| ratio
| every 1m
| condition gt(val(), 0.75 '1')
EOT
      duration = "60s"
    }
  }

  notification_channels = ["${google_monitoring_notification_channel.basic.name}"]
}



resource "google_monitoring_notification_channel" "basic" {
  display_name = "CPU Quota Approaching"
  type         = "email"
  labels = {
    email_address = "<EMAIL>"
  }
}