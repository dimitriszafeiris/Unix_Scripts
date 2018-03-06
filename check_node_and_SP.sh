#!/bin/bash

NODENICK=$1
SPRINT=$2

if [[ $NODENICK = mgmt && $SPRINT -gt 49 ]]; then

	echo "Mgmt node will be updated from Sprint50 and so on..."
	#commands
else
    echo "We are not at mgmt node or we are at a Print prior to 50..."
fi
