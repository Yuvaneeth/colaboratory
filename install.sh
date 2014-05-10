#!/bin/bash
# Builds and installs the web app

# Build an IPython profile containing startup (Python) scripts, and
# static content for front end.
BUILD_DIR=build/profile_default

STATIC_CONTENT_DIR=$BUILD_DIR/static

mkdir -p $BUILD_DIR/
mkdir -p $STATIC_CONTENT_DIR/

# copy static files to build directory
cp -r static/* $STATIC_CONTENT_DIR/

# copy Google Closure library to build directory
cp -r ../closure-library/closure/goog/* $STATIC_CONTENT_DIR/frontend/js/

# Create deps.js
../closure-library/closure/bin/build/depswriter.py --root=../closure-library/closure/goog --root=static/frontend/js/ > $STATIC_CONTENT_DIR/frontend/js/deps.js

# copy Google Closure css
mkdir -p build/static/frontend/css
cp -r ../closure-library/closure/goog/css/* $STATIC_CONTENT_DIR/frontend/css/

# copy extern files into build directory
cp -r extern/* $STATIC_CONTENT_DIR/

# copy files built by the Google build system to build directory
# (note, this files should be replaced with files that are built
# directly from source.
cp -r built_js/* $STATIC_CONTENT_DIR/frontend/js
cp -r built_css/* $STATIC_CONTENT_DIR/frontend/css