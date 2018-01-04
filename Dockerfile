FROM busybox:latest

COPY init.sh /

CMD ["sh","init.sh"]
