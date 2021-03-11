FROM alpine:3.13
RUN apk --update add nodejs yarn npm cmake autoconf automake libtool binutils libexecinfo-dev python2 gcc make g++ zlib-dev --no-cache
RUN yarn global add aws-lambda-ric

FROM alpine:3.13
RUN apk --update add nodejs yarn npm bash
COPY --from=0 /usr/local/share/.config/yarn/global/node_modules /usr/local/share/.config/yarn/global/node_modules
COPY --from=0 /usr/local/bin /usr/local/bin
COPY aws-lambda-rie /usr/local/bin
COPY entrypoint.sh /root/entrypoint.sh

ENV LAMBDA_TASK_ROOT=/var/task
ENV LAMBDA_RUNTIME_DIR=/var/runtime

WORKDIR $LAMBDA_TASK_ROOT

ENTRYPOINT [ "/root/entrypoint.sh" ]
CMD [ "index.handler" ]