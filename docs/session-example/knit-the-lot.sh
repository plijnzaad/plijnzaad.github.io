#!/bin/sh

## go where this script lives:
cd $(dirname $(readlink -e $BASH_SOURCE))

R -e "rmarkdown::render('example.Rmd')"

rm example.html # jekyll will generate its own

## echo "*** When rending locally with Jekyll, add \n---\nlayout: default\n---\n ***"

\mv -f example.md  example.md~

(echo "---\nlayout: default\n---\n"
 cat example.md~
 echo "\n\n### [Back to main](../README.md)"
) > example.md

rm example.md~
