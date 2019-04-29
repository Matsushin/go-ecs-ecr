#!/bin/sh

eval $(aws ecr get-login --no-include-email --region ap-northeast-1)
docker push $AWS_ACCOUNT_ID.dkr.ecr.ap-northeast-1.amazonaws.com/go-sample-webapp:$CIRCLE_SHA1
./scripts/ecs-deploy --cluster sample-webapp-cluster --service-name sample-webapp-service5 --image $AWS_ACCOUNT_ID.dkr.ecr.ap-northeast-1.amazonaws.com/go-sample-webapp:$CIRCLE_SHA1 --timeout 600