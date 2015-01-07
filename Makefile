.PHONY: setup
.PHONY: createcandidate
.PHONY: viewcandidate
.PHONY: dropcandidate

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

viewcandidate:
	docker run --link postgres:postgres -it psql /usr/bin/psql -U postgres candidate

dropcandidate:
	docker run --link postgres:postgres -it psql /usr/bin/dropdb -U postgres candidate

createcandidate:
	docker run --link postgres:postgres -it psql /usr/bin/createdb -U postgres candidate

push: setup
	docker tag postgres iansmith/service-postgres	
	docker tag etcd iansmith/service-etcd
	docker tag psql iansmith/service-psql
	docker tag gotooling iansmith/service-gotooling
	docker push iansmith/service-postgres
	docker push iansmith/service-etcd
	docker push iansmith/service-psql
	docker push iansmith/service-gotooling
