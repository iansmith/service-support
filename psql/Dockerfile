FROM ubuntu
MAINTAINER eng@igneous.io

RUN DEBIAN_FRONTEND=noninteractive apt-get update -q
RUN apt-cache search postgresql-client
RUN DEBIAN_FRONTEND=noninteractive apt-get install -q -y postgresql-client-9.3

##default to running locally
ENV PGHOST=postgres
CMD ["/usr/bin/pqsl"]
