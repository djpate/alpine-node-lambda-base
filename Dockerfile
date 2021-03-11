FROM alpine:3.13
RUN apk --update add nodejs yarn npm cmake autoconf automake libtool binutils libexecinfo-dev python2 gcc make g++ zlib-dev --no-cache
RUN yarn global add aws-lambda-ric

FROM alpine:3.13
RUN apk --update add nodejs yarn npm bash
COPY --from=0 /usr/local/share/.config/yarn/global/node_modules /usr/local/share/.config/yarn/global/node_modules
COPY --from=0 /usr/local/bin /usr/local/bin
COPY aws-lambda-rie /usr/local/bin

ENV LAMBDA_TASK_ROOT=/var/task
WORKDIR $LAMBDA_TASK_ROOT
COPY entrypoint.sh entrypoint.sh

ENTRYPOINT [ "./entrypoint.sh" ]
CMD [ "index.handler" ]