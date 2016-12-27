#!/usr/bin/env io

OperatorTable addAssignOperator(":", "atPutNumber")
curlyBrackets := method(
    r := Map clone
    call message arguments foreach(arg,
        r doString(arg asString)
    )
    r
)
Map atPutNumber := method(
    self atPut(
        call evalArgAt(0) asMutable removePrefix("\"") removeSuffix("\""),
        call evalArgAt(1)
    )
)

Builder := method(
    self indent := 0

    self forward := method(
        arguments := call message arguments
        "  " repeated(indent) print
        write("<", call message name)
        if(arguments first name == "curlyBrackets",
            attributes := doMessage(arguments removeFirst)
            attributes foreach(key, value,
                write(" ", key, "=", "\"", value, "\"")
            )
        )
        writeln(">")
        arguments foreach(message,
            indent = indent + 1

            content := self doMessage(message);
            if(content type == "Sequence",
                "  " repeated(indent) print
                writeln(content)
            )
            indent = indent - 1
        )
        "  " repeated(indent) print
        writeln("</", call message name, ">")
    )
    self
)

builder := Builder clone
builder ul(
    {"author": "Tate"},
    li("Io"),
    li("Lua"),
    li("JavaScript")
)
