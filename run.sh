#!/bin/bash

############################################################################
#
# If you have an error for some reason, you would better to try again.
#

ECHO=
LIST=`ls`
CHECK="ok"

for l in $LIST ;do
 if [ "$l" == "mySettings" ]; then
   echo "mySettings exists!"
   echo ""
   CHECK=
 fi
done

if [ "$CHECK" == "ok" ]; then
  $ECHO ./getMySetting.sh
fi

# build docker image
$ECHO docker build --tag zerolive7/ubuntu1804:base .
