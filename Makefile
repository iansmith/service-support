setup:
	-docker stop etcd
	-docker stop postgres
	-docker stop psql
	-docker rm etcd
	-docker rm postgres
	-docker rm psql

	docker build -t etcd etcd
	docker build -t gotooling gotooling
	docker build -t postgres postgres
	docker build -t psql psql

	docker run -d -p 7001:7001 -p 4001:4001 --name etcd etcd
	docker run -d -p 5432:5432 --name postgres postgres


#
# WAYS TO USE PSQL
# 
#mydb:
#	docker run --link postgres:postgres -it psql /usr/bin/psql -U postgres fart

#dropdb
#	docker run --link postgres:postgres -it psql /usr/bin/dropdb -U postgres fart

#createdb
#	docker run --link postgres:postgres -it psql /usr/bin/createdb -U postgres fart