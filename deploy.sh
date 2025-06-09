export $(cat .env | xargs)
aws ecr get-login-password --region ${AWS_REGION} | docker login --username AWS --password-stdin ${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com

export ARC3_API_VER=`aws ecr describe-images --repository-name $AWS_ARC3_API_REPO_NAME --query 'sort_by(imageDetails,& imagePushedAt)[-1]' | jq -r '.imageTags[0]'`
export UNITY_VER=`aws ecr describe-images --repository-name $AWS_UNITY_REPO_NAME --query 'sort_by(imageDetails,& imagePushedAt)[-1]' | jq -r '.imageTags[0]'`
export ARC3_VER=`aws ecr describe-images --repository-name $AWS_ARC3_REPO_NAME --query 'sort_by(imageDetails,& imagePushedAt)[-1]' | jq -r '.imageTags[0]'`

docker compose -f docker-compose.yml up