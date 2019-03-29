FROM sphinxgaia/training-centos:latest as builder

COPY java /tmp/

RUN yum install -y java-11-openjdk-devel

WORKDIR /tmp
RUN javac HelloWorld.java

FROM sphinxgaia/training-centos:latest as luncher

RUN mkdir /app
COPY --from=builder /tmp/HelloWorld.class /app/
RUN yum install -y java-11-openjdk-headless

COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh


WORKDIR /app

ENTRYPOINT [ "/entrypoint.sh" ]
CMD ["java","HelloWorld"]