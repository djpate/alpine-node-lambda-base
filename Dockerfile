FROM alpine:latest
RUN apk --update add python3 nodejs yarn npm cmake autoconf automake libtool binutils libexecinfo-dev gcc make g++ zlib-dev --no-cache
RUN yarn global add aws-lambda-ric

FROM zenika/alpine-chrome:102-with-node-16
USER root
RUN apk --update add bash
COPY --from=0 /usr/local/share/.config/yarn/global/node_modules /usr/local/share/.config/yarn/global/node_modules
COPY --from=0 /usr/local/bin /usr/local/bin
COPY aws-lambda-rie /usr/local/bin
COPY entrypoint.sh /entrypoint.sh
USER chrome

ENV LAMBDA_TASK_ROOT=/var/task
ENV LAMBDA_RUNTIME_DIR=/var/runtime

WORKDIR $LAMBDA_TASK_ROOT

ENTRYPOINT [ "/entrypoint.sh" ]
CMD [ "index.handler" ]