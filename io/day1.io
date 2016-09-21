#!/usr/bin/env io

## Some Io example problems
## http://iolanguage.org/scm/io/docs/IoTutorial.html

## Community
## https://twitter.com/iolanguage

## Idioms
## http://iolanguage.org/scm/io/docs/IoGuide.html#Syntax
## http://iolanguage.org/scm/io/docs/IoGuide.html#Appendix-Grammar


## Q: Is Io strongly or weakly typed?
"" print
# (1 + 'one') print

## A: Io is strongly typed
"###############################################" print
"" print

## Q: Is 0 true or false
(0 and true) and (0 or false) print
## A: 0 is true

## Q: Is "" true or false
## ("" and true) and ("" or false)
## A: empty string is true

## Q: Is nil true or false
## (nil and true) ...(nil or false)
## A: nil is false

## How can you tell what slots a prototype supports?
## o := Object clone
## o proto slotNames


