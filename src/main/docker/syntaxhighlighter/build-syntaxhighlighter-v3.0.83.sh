#!/bin/bash
set -x #echo on

### In order to build "SyntaxHighlighter v3.0.83" [1], you need an old PHP plus
### Java. Otherwise, when running "PHING" (and its single build steps) an error
### is thrown (that raises since PHP 5.4).
###
### Instead of fixing this situation by installing the old "PHP", I prefer the
### containered way [2].
###
### 
### Stefan Gasterstädt
### April 30th, 2017
###
### ---
### [1] https://github.com/syntaxhighlighter/syntaxhighlighter/tree/3.0.83/build
### [2] https://hub.docker.com/_/php/
###     https://github.com/dockerfile/java/tree/master/openjdk-7-jre 

# According to [1], this is the build commands order:

cd build

# 1. Update PHP_COMMAND variable in the build(.bat)

# We do not use "mercurial/hg", thus we fix the version's patch level detection 
sed -i 's/\(revision hgpath.*\/\)/!-- \1 --/g' build.xml
sed  -i '1i version.revision=83' properties/version.properties

# 2. Run build(.bat)

sh ./ext/phing/bin/phing -f build.xml

# 3. Look in the ./output folder
# 4. Enjoy!
