#!/bin/bash

NUON_VARS=$(env | grep '^NUON_' | jq -R -n '
  reduce (inputs | select(length > 0) | split("=")) as [$key, $value] (
    {};
    . + {
      ($key | sub("^NUON_"; "") | ascii_downcase): $value
    }
  )
')

ADDITIONAL_VARS=$(cat <<EOF
{
  "aws_region": "$AWS_REGION"
}
EOF
)

echo "$NUON_VARS" | jq --argjson manual "$ADDITIONAL_VARS" '. + $manual'
