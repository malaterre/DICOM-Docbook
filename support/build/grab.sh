#!/bin/sh -e

set -x

wget -c http://dicom.nema.org/medical/dicom/current/DocBookDICOM2015c_sourceandrenderingpipeline_20150705073023.tar.bz2

mkdir -p tmp
tar -C tmp -x -f DocBookDICOM2015c_sourceandrenderingpipeline_20150705073023.tar.bz2

rm -rf tmp/docbook-xsl-ns-1.78.1
rm -rf tmp/lib
#rm -rf tmp/pMML2SVG-0.8.5/
rm -rf tmp/pMML2SVG-0.8.5/examples
rm -rf tmp/pMML2SVG-0.8.5/doc
rm -rf tmp/pMML2SVG-0.8.5/ttfreader
#rm     tmp/pMML2SVG-0.8.5/*
rm -rf tmp/XEP_trial
rm -rf tmp/catalogs
rm -rf tmp/wordexport
#rm -rf tmp/stylesheets
rm -rf tmp/svg2emf

# do not mess with the current one:
rm -rf tmp/source
rm -rf tmp/support

mv tmp/* .

#TODO:
#CUR=$PWD
#sed -i -e "s:/Users/dclunie/Documents/Work/DICOM_Publish_XML/DocBookDICOM2013/:$CUR:" ./olinkdb_pdf.xml
#sed -i -e 's:/opt/local/share/java/saxon9he.jar:/usr/share/java/Saxon-HE.jar:' *.sh
