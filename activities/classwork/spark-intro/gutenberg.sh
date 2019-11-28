#!/bin/bash

echo "Downloading books into gutenberg folder..."
mkdir gutenberg
wget -m -H -nd "http://www.gutenberg.org/robot/harvest?filetypes[]=txt&langs[]=en" -P gutenberg

echo "Removing robots and harvest..."
rm gutenberg/robots.*
rm gutenberg/harvest*

echo "Removing duplicate encodings..."
ls gutenberg | grep -e "-8.zip" | sed -e 's/^/gutenberg\//' | xargs rm
ls gutenberg | grep -e "-0.zip" | sed -e 's/^/gutenberg\//' | xargs rm

echo "Unzipping content..."
unzip "gutenberg/*.zip" -d gutenberg

echo "Removing zip files..."
rm gutenberg/*.zip

echo "Obtaining txt files..."
mv gutenberg/*/*.txt gutenberg/
ls gutenberg | grep -v "\.txt" | sed -e 's/^/gutenberg\//' | xargs rm -rf

echo "Done."
