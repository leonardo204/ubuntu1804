#!/bin/bash

ECHO=

doFind()
{
  ids=`docker ps -a | awk '{print $1}'`
  k=0

  for i in ${ids}; do
    if [ "$i" == "CONTAINER" ]; then continue; fi
    echo "ids[$k]="$i
    $ECHO doRemove $i
    let k=$k+1
  done
}

doRemove()
{
  docker rm $1
}

Run()
{
  doFind
}

export -f doFind
export -f doRemove

Run
