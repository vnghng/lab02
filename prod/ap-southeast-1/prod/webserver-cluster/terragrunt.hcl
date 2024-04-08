include "root" {
  path = find_in_parent_folders()
}

include "envcommon" {
  path = "${dirname(find_in_parent_folders())}/_envcommon/webserver-cluster.hcl"

  expose = true
}

terraform {
  source = "${include.envcommon.locals.base_source_url}?ref=v0.8.0"
}

inputs = {
  instance_type = "t2.medium"
  min_size = 3
  max_size = 3
}
