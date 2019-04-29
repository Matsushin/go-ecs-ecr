#!/bin/sh

eval $(aws ecr get-login --region ap-northeast-1 --no-include-email)
docker push $AWS_ACCOUNT_ID.dkr.ecr.ap-northeast-1.amazonaws.com/go-sample-webapp:$CIRCLE_SHA1
./scripts/ecs-deploy --cluster sample-webapp-cluster --service-name sample-webapp-service5 --image $AWS_ACCOUNT_ID.dkr.ecr.ap-northeast-1.amazonaws.com/go-sample-webapp:$CIRCLE_SHA1