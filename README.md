# service-support
service-support for dealing with docker files on deis

This repository has a makefile plus some Dockerfiles to create the local images you'll need for development.
By using these images you can have a "nice" local dev experience and use exactly the same Dockerfile for
deployment.  

This repo's makefile creates the images locally and then launches some containers so your DOCKER_HOST has to be
set to something sensible.  The containers are ones that you can "leave up" and they have names that reflect what
services they export.  

The services are:
* etcd
* posgtgres

The two support images
* gotooling
* psql

The first of these is the "builder" for go programs that vendor with godeps.   The second is just the utility
`psql` for connecting to postgres.  You can use it to connect to the container launched above on
the database somedatabase  with 
`docker run --link postgres:postgres -it psql /usr/bin/psql -U postgres somedatabase`. 

The makefile has some other examples of doing provisioning with the psql container.
