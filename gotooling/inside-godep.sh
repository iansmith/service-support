#!/bin/sh 

if [ ! -n "$IGNEOUS_PROG" ]; then
	echo "IGNEOUS_PROG environment variable not set"
	exit 1
fi

if [ ! -d "/go/src/github.com/igneous-systems/$IGNEOUS_PROG" ]; then
	echo "can't understand IGNEOUS_PROG environment variable"
	exit 1
fi

GITHACK="yes"

if [ -d "/go/src/github.com/igneous-systems/$IGNEOUS_PROG/.git" ]; then
	echo "found a .git in the IGNEOUS_PROG directory, no git tricks needed."
	GITHACK="no"
fi

## this horrible hack is necessary because of the fact that we are doing
## tricks with the gopath that confuse godeps.  it wants there to be a
## a version control system repository at the level of the project
## that you are running godeps at. 

if [ "${GITHACK}" == "yes" ]; then
	cd /go/src/github.com/igneous-systems/$IGNEOUS_PROG/
	git init . > /dev/null
	git config --global user.name "Godep NeedsWork"
	git config --global user.email "brokenhack@example.com"
	git commit --allow-empty -m "no message" > /dev/null
fi

cd /go/src/github.com/igneous-systems/$IGNEOUS_PROG/
godep save ./...

OK="yes"
if [ "$?" != "0" ]; then
		echo "******* "
		echo "******* godep failed!"
		echo "******* "
		OK="no"
fi

if [ "${GITHACK}" = "yes" ]; then
	#scary
	rm -rf .git
fi

##show us what happened
if [ "${OK}" = "no" ]; then
	exit 1
fi

cat /go/src/github.com/igneous-systems/$IGNEOUS_PROG/Godeps/Godeps.json
