#!/bin/sh -e

# Update polymer-cli's dependency on polymer-build so that it uses
# a build of polymer-build#missing-file-handling (commit df7b17c)

cd node_modules/polymer-cli
npm i Polymer/polymer-build#df7b17c
cd node_modules/polymer-build

# Ignore the error from the prepublish test. One of the unit tests
# is emitting an error, but it's not actually a test failure.
npm i
