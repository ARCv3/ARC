
aws ecr get-login-password --profile personal  --region ${AWS_REGION} | docker login --username AWS --password-stdin ${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com

export ARC3_API_VER=`aws ecr describe-images --profile personal --repository-name arc3-api --query 'sort_by(imageDetails,& imagePushedAt)[-1]' | jq -r '.imageTags[0]'`
export UNITY_VER=`aws ecr describe-images --profile personal --repository-name unity --query 'sort_by(imageDetails,& imagePushedAt)[-1]' | jq -r '.imageTags[0]'`
export ARC3_VER=`aws ecr describe-images --profile personal --repository-name arc3 --query 'sort_by(imageDetails,& imagePushedAt)[-1]' | jq -r '.imageTags[0]'`

docker compose -f docker-compose.yml up