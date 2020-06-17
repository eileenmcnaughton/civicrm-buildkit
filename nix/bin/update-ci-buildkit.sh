#!/bin/bash
for OWNER in jenkins publisher ; do
  for PROF in dfl min max old edge ; do
    if [ -d "/home/$OWNER/bknix-$PROF" ]; then
      echo "Update \"$PROF\" for user \"$OWNER\""
      su - $OWNER -c 'eval $(use-bknix '$PROF') && cd $LOCO_PRJ && git pull && ./bin/civi-download-tools'
    fi
  done
done