#!/bin/bash
#-----------------------------------------------------------------------
# Description:
# This script will run terraform commands to provision Grafana Dashboard
#-----------------------------------------------------------------------

set -e

terraform init
terraform validate
terraform plan
terraform apply --auto-approve
