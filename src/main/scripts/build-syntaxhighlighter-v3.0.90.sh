#!/bin/bash

# In order to build "SyntaxHighlighter v3.0.90" [1], you might want to read the
# bit more verbose guide by Blaise Liu [2]. Beside, you need an old "Node.js".
# Otherwise, when running "grunt" an error is thrown:
#     Error: Module did not self-register
#
# Instead of fixing this situation by installing the old "Node.js" [3], I prefer
# the containered way [4]:
#     docker run -it --rm --name build-syntaxhighlighter \
#            -v "$PWD":/usr/src/app -w /usr/src/app \
#            node:0.10.32 \
#            /bin/bash build-syntaxhighlighter.sh
#
# Unfortunately, "docker run ..." uses the "root" user by default and, thus,
# "bower" requires the "--allow-root" flag. (Until now, I did not consider
# running the docker container as non-root [5].)
#
# PS: If the docker execution by maven fails, you can do it yourself (e.g.,
# using "sudo"). Subsequently, you can simply call
#     mvn antrun:run@provide-syntaxhighlighter jar:jar
# to invoke prepare and build the package.
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
# [5] https://blog.csanchez.org/2017/01/31/running-docker-containers-as-non-root/
# npm install -g bower
# npm install -g grunt
# bower --allow-root install
bower --allow-root install
npm install
grunt build
