docker login
wget https://github.com/aws/aws-lambda-runtime-interface-emulator/releases/latest/download/aws-lambda-rie -O aws-lambda-rie && chmod +x aws-lambda-rie
docker build --no-cache --pull -t djpate/alpine-node-lambda:latest .
docker push djpate/alpine-node-lambda:latest
# cd with-chromium
# docker build -t djpate/alpine-node-lambda:chromium .
# docker push djpate/alpine-node-lambda:chromium