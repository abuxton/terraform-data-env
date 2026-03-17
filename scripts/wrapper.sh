#!/bin/sh
# scripts/wrapper.sh
# Terraform external data source requires input JSON on stdin
# We discard it but must consume it to be compliant if strict
cat > /dev/null

# Call the actual script
sh $(dirname "$0")/sys_info.sh
