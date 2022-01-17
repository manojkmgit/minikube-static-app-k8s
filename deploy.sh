GIT_SHA=$(git rev-parse HEAD)

docker build -t manojkmhub/static-website-k8s:$GIT_SHA .

docker push manojkmhub/static-website-k8s:$GIT_SHA

kubectl apply -f k8s/namespace.yaml

kubetctl apply -f k8s/

kubectl set image deployment.apps/static-web-deployment -n=sample days-app-container=manojkmhub/static-website-k8s:$GIT_SHA
