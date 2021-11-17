provider "google" {
  project = "${var.project_id}"
  region = "${var.region}"
}

resource "google_monitoring_alert_policy" "CPU_quota_check" { //Works for all region by default
  count = "${var.cpu_enabled}"
  
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
| condition gt(val(), ${var.cpu_threshold} '1')
EOT
      duration = "60s"
    }
  }

    notification_channels = "${google_monitoring_notification_channel.basic.*.name}"

}

resource "google_monitoring_alert_policy" "SSD_quota_check" { //Works for all region by default
  count = "${var.ssd_pd_enabled}"

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
| condition gt(val(), ${var.ssd_pd_threshold} '1')
EOT
      duration = "60s"
    }
  }

    notification_channels = "${google_monitoring_notification_channel.basic.*.name}"

}

resource "google_monitoring_alert_policy" "IP_usage_quota" { //Works for all region by default
  count = "${var.ip_enabled}"

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
| condition gt(val(), ${var.ip_threshold} '1')
EOT
      duration = "60s"
    }
  }

    notification_channels = "${google_monitoring_notification_channel.basic.*.name}"

}

resource "google_monitoring_alert_policy" "P4_usage_quota" { //Works for all region by default
  count = "${var.p4_enabled}"

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
| condition gt(val(), ${var.p4_threshold} '1')
EOT
      duration = "60s"
    }
  }

    notification_channels = "${google_monitoring_notification_channel.basic.*.name}"

}

resource "google_monitoring_alert_policy" "T4_usage_quota" { //Works for all region by default
  count = "${var.t4_enabled}"

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
| condition gt(val(), ${var.t4_threshold} '1')
EOT
      duration = "60s"
    }
  }

    notification_channels = "${google_monitoring_notification_channel.basic.*.name}"

}

resource "google_monitoring_alert_policy" "K80_usage_quota" { //Works for all region by default
  count = "${var.k80_enabled}"

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
| condition gt(val(), ${var.k80_threshold} '1')
EOT
      duration = "60s"
    }
  }

    notification_channels = "${google_monitoring_notification_channel.basic.*.name}"

}

resource "google_monitoring_alert_policy" "V100_usage_quota" { //Works for all region by default
  count = "${var.v100_enabled}"

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
| condition gt(val(), ${var.v100_threshold} '1')
EOT
      duration = "60s"
    }
  }

  notification_channels = "${google_monitoring_notification_channel.basic.*.name}"
}



resource "google_monitoring_notification_channel" "basic" {
  count = length("${var.email_address}")

  display_name = "Quota threshold exceeded - ${var.email_address[count.index]}"
  type         = "email"
  labels = {
    email_address = "${var.email_address[count.index]}"
  }
}