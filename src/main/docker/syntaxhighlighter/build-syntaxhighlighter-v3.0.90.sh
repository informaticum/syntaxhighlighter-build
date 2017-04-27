#!/bin/bash

### In order to build "SyntaxHighlighter v3.0.90" [1], you need an old
### "Node.js". Otherwise, when running "grunt" an error is thrown:
###     Error: Module did not self-register
###
### Instead of fixing this situation by installing the old "Node.js" [2], I
### prefer the containered way [3]:
###     docker run -it --rm --name node-build-env -v "$PWD":/home/bob/workspace \
###            node:0.10.32 \
###            /bin/bash
###
### 
### Stefan Gasterstädt
### April 23rd, 2017
###
### ---
### [1] https://github.com/syntaxhighlighter/syntaxhighlighter/tree/v3.0.90###building
### [2] http://www.saintsatplay.com/blog/2015/03/resolving-node-module-did-not-self-register-errors
### [3] https://hub.docker.com/_/node/

# According to [1], this is the build commands order:
# 1.) Have node.js v0.10 or higher
# 2.) From the source folder run npm install
npm install
# 3.) Then ./node_modules/.bin/bower install to download dependencies
./node_modules/.bin/bower install
# 4.) Then ./node_modules/.bin/grunt build to build
./node_modules/.bin/grunt build
# 5.) Look in the pkg folder for results!
