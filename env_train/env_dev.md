#Remote State Initial - Disable

>AWS_ACCESS_KEY_ID=xxxxxxxxxxxx
AWS_SECRET_ACCESS_KEY=xxxxxxxxxxxx

>../terraform init \
    -backend-config="bucket=jd-k8s-cluster-state-db" \
    -backend-config="region=ap-northeast-1" \
    -backend-config="encrypt=true" \
    -backend-config="key=jd-train/env/dev"