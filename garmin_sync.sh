#!/bin/sh
SRC_DIR=/Volumes/GARMIN/Garmin/GPX
SRC_ARCHIVE_DIR=$SRC_DIR/Archive
DEST_DIR=/Users/gaku/safe/gps

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

