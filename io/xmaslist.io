#!/usr/bin/env io
#######################
# Call doString("[]") to determine the method the parser calls
#######################
squareBrackets := method(
    r := List clone
    call message arguments foreach(arg,
        r push(doMessage(arg) asMutable removePrefix("\"") removeSuffix("\""))
    )
    r
)

s := File with("xmaslist.txt") openForReading contents
xmasList := doString(s)
xmasList println
