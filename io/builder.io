#!/usr/bin/env io

Builder := Object clone

Builder forward := method(
    arguments := call message arguments
    indent := Number clone
    if(call sender type == "Builder" and call evalArgAt(0) type == "Number",
        indent = call sender doMessage(arguments removeFirst) asNumber()

    )
    "  " repeated(indent) print
    writeln("<", call message name, ">")
    arguments foreach(message,
        level := indent + 1
        messageArgs := message arguments prepend(level asString() asMessage())
        message setArguments(messageArgs)
        content := self doMessage(message);
        if(content type == "Sequence",
            "  " repeated(level) print
            writeln(content)
        )
    )
    "  " repeated(indent) print
    writeln("</", call message name, ">")
)

Builder ul(
    li("Io"),
    li("Lua"),
    li("JavaScript")
)
