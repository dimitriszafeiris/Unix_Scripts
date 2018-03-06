#!/bin/bash

echo "Creating a spec file in order json to be created when rpm installed..."

#Addition for client versions at management
if [ $NODENICK = mgmt ];then

                WEBCLIENT_VERSION=`cat $WORKSPACE/pom.xml | grep '<webclient-version-rpm>' | grep -o -P '(?<=>).*(?=</version)'`
                DESKTOPAPP_VERSION=`cat $WORKSPACE/pom.xml | grep '<desktopapp-version-rpm>' | grep -o -P '(?<=>).*(?=</version)'`
                TELEPHONYCONNECTOR_VERSION=`cat $WORKSPACE/pom.xml | grep '<telephonyconnector-version-rpm>' | grep -o -P '(?<=>).*(?=</version)'`
                OUTLOOK_VERSION=`cat $WORKSPACE/pom.xml | grep '<outlook-version-rpm>' | grep -o -P '(?<=>).*(?=</version)'`
                MEETING_ROOM_VERSION=`cat $WORKSPACE/pom.xml | grep '<meeting_room-version-rpm>' | grep -o -P '(?<=>).*(?=</version)'`
				ANDROID_VERSION=`cat $WORKSPACE/pom.xml | grep '<android-version-rpm>' | grep -o -P '(?<=>).*(?=</version)'`
                IOS_VERSION=`cat $WORKSPACE/pom.xml | grep '<ios-version-rpm>' | grep -o -P '(?<=>).*(?=</version)'`
				
                echo "sudo mkdir -p /etc/platform/clients" >> $SPEC_FILE
                echo "echo { > /etc/platform/clients/clients.json" >> $SPEC_FILE
                echo "echo \"\\"\""webclient\\\":\\\"$WEBCLIENT_VERSION\\\",\" >> /etc/platform/clients/clients.json" >> $SPEC_FILE
                echo "echo \"\\"\""desktopapp\\\":\\\"$DESKTOPAPP_VERSION\\\",\" >> /etc/platform/clients/clients.json" >> $SPEC_FILE
                echo "echo \"\\"\""outlook\\\":\\\"$OUTLOOK_VERSION\\\",\" >> /etc/platform/clients/clients.json" >> $SPEC_FILE
                echo "echo \"\\"\""ios\\\":\\\"$IOS_VERSION\\\",\" >> /etc/platform/clients/clients.json" >> $SPEC_FILE
                echo "echo \"\\"\""android\\\":\\\"$ANDROID_VERSION\\\",\" >> /etc/platform/clients/clients.json" >> $SPEC_FILE
                echo "echo \"\\"\""meeting_room\\\":\\\"$MEETING_ROOM_VERSION\\\",\" >> /etc/platform/clients/clients.json" >> $SPEC_FILE
                echo "echo \"\\"\""telephonyconnector\\\":\\\"$TELEPHONYCONNECTOR_VERSION\\\"\" >> /etc/platform/clients/clients.json" >> $SPEC_FILE
                echo "echo } >> /etc/platform/clients/clients.json" >> $SPEC_FILE
                echo "sudo /bin/chown user:group /etc/platform/clients/clients.json" >> $SPEC_FILE
fi
