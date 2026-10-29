#!/usr/bin/env bash
set -euo pipefail

BUCKET="bombtag.bastionforge.com"

echo "Syncing to S3..."
aws s3 sync . "s3://$BUCKET" \
  --delete \
  --exclude "*" \
  --include "index.html" \
  --cache-control "public, max-age=3600"

echo "Invalidating CloudFront cache..."
DISTRIBUTION_ID=$(cd infra && terraform output -raw cloudfront_distribution_id)
aws cloudfront create-invalidation \
  --distribution-id "$DISTRIBUTION_ID" \
  --paths "/*" \
  --query 'Invalidation.Id' \
  --output text

echo "Deployed to https://bombtag.bastionforge.com"
