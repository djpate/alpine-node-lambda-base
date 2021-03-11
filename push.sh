docker build -t djpate/alpine-node-lambda:latest .
docker push djpate/alpine-node-lambda:latest
cd with-chromium
docker build -t djpate/alpine-node-lambda:chromium .
docker push djpate/alpine-node-lambda:chromium