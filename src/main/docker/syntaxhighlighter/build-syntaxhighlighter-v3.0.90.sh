#!/bin/bash

# In order to build "SyntaxHighlighter v3.0.90" [1], you might want to read the
# bit more verbose guide by Blaise Liu [2]. Beside, you need an old "Node.js".
# Otherwise, when running "grunt" an error is thrown:
#     Error: Module did not self-register
#
# Instead of fixing this situation by installing the old "Node.js" [3], I prefer
# the containered way [4]:
#     docker run -it --rm --name node-build-env -v "$PWD":/home/bob/workspace \
#            node:0.10.32 \
#            /bin/bash
#
# 
# Stefan Gasterstädt
# April 23rd, 2017
#
# ---
# [1] https://github.com/syntaxhighlighter/syntaxhighlighter/tree/v3.0.90
# [2] http://www.blaiseliu.com/build-the-latest-version-of-syntaxhighlighter/
# [3] http://www.saintsatplay.com/blog/2015/03/resolving-node-module-did-not-self-register-errors
# [4] https://hub.docker.com/_/node/

bower install
npm install
grunt build
