FROM crystallang/crystal:1.1.1

ENV KEMAL_ENV=production
COPY ./ /home/app
WORKDIR /home/app
RUN ["shards" ,"install"]
RUN ["shards", "build", "--release"]
CMD ["sh", "-c", "/home/app/bin/kingofvnese -p $PORT"]