#!/bin/sh -e

set -x

wget -c http://dicom.nema.org/medical/dicom/current/DocBookDICOM2015c_sourceandrenderingpipeline_20150705073023.tar.bz2

mkdir -p tmp
tar -C tmp -x -f DocBookDICOM2015c_sourceandrenderingpipeline_20150705073023.tar.bz2

rm -rf tmp/docbook-xsl-ns-1.78.1
rm -rf tmp/lib
rm -rf tmp/pMML2SVG-0.8.5
rm -rf tmp/XEP_trial
rm -rf tmp/catalogs
rm -rf tmp/wordexport
#rm -rf tmp/stylesheets
rm -rf tmp/svg2emf

# do not mess with the current one:
rm -rf tmp/source
rm -rf tmp/support

mv tmp/* .
