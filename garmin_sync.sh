#!/bin/sh
VOLUME=GARMIN
SRC_DIR=/Volumes/$VOLUME/Garmin/GPX
SRC_ARCHIVE_DIR=$SRC_DIR/Archive
DEST_DIR=/Users/gaku/safe/gps

if [ ! -e $SRC_ARCHIVE_DIR ]; then
  echo "ERROR: Garmin device is not mounted?"
  exit 1
fi

for gpx in $SRC_ARCHIVE_DIR/*.gpx
do
  FILENAME=`basename $gpx`
  if [ -e $DEST_DIR/$FILENAME ]; then
    echo file found $FILENAME;
  else
    echo copy file $FILENAME
    cp $SRC_ARCHIVE_DIR/$FILENAME $DEST_DIR
  fi
done
SRC_CURRENT_DIR=$SRC_DIR/Current
echo copy Current.gpx
cp $SRC_CURRENT_DIR/Current.gpx $DEST_DIR
# unmount the volume
diskutil unmountdisk $VOLUME
