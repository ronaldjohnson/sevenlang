#!/usr/bin/env io

## Some Io example problems
## http://iolanguage.org/tutorial.html

## Community
## https://twitter.com/iolanguage

## Idioms
## http://iolanguage.org/guide/guide.html#Syntax-Expressions
## http://iolanguage.org/guide/guide.html#Appendix-Grammar
## http://iolanguage.org/guide/guide.html#Introduction-Running-Scripts


## Q: Is Io strongly or weakly typed?
"" print
# (1 + 'one') print
list(1, "one") foreach(i, (1 + i) println)

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
## http://iolanguage.org/guide/guide.html#Objects-Introspection
## o := Object clone
## o proto slotNames

## Execute the code in a slot given its name
someObject := Object clone
someObject someMethod := method("hello world" print)
someObject someMethod
