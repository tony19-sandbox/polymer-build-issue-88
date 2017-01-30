#!/bin/sh -e

root=$PWD

# Delete polymer-cli's polymer-build now, or else npm fails
# if polymer-build is already symlinked.
rm -rf node_modules/polymer-cli/node_modules/polymer-build

# Build polymer-build#missing-file-handling @df7b17c
npm i Polymer/polymer-build#df7b17c
pushd node_modules/polymer-build
npm i || true  # ignore false-negative error
popd

# Link polymer-cli to the polymer-build we just built
cd node_modules/polymer-cli
echo linking polymer-build in polymer-cli ...
ln -s $root/node_modules/polymer-build node_modules/polymer-build
