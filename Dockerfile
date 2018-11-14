FROM alpine

EXPOSE 80 9050

RUN apk --update add privoxy tor runit tini

COPY service service/
RUN chmod -R +x service/


ENTRYPOINT ["tini", "--"]
CMD ["runsvdir", "service"]
