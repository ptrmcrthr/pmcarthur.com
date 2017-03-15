#!/bin/bash

echo starting

DATE=`date +"%B %e, %Y"`

rm -rf _deployable
cp -R website/ _deployable/

sed -i "s#LAST_UPDATED_ON#${DATE}#" _deployable/*.html
gsutil cp -a public-read _deployable/*.html gs://pmcarthur.com/
gsutil setmeta -h "Cache-Control: max-age=0, s-maxage=86400" gs://pmcarthur.com/*.html
echo done
