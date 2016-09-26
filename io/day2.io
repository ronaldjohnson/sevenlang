#!/usr/bin/env io

#1
###################
"1)" println

fib := method(n,
    (n > 2) ifTrue(
        return (fib(n - 2) + fib(n - 1))
    )
    return 1
)

fib(8) println
fib(2) println
"" println

fib = method(n,
        total := 0
        a := 1
        b := 1
        for(i, 1, n,
            (i > 2) ifTrue (
                total = a + b
                a = b
                b = total
            ) ifFalse (
                total = 1
            )
        )
        return total
)

fib(7) println
fib(1) println

#2
###################
"2)" println

(2 / 0) println

Number / = block(div,
    OperatorTable addOperator("div", 2)
    Number div := div
    return method(d,
        (d == 0) ifTrue(
            return 0
        ) ifFalse(
            return (self div d)
        )
    )
)(Number getSlot("/"))

(4 / 0) println

/* 3
 ****************/
"3)" println
twoDimArray := list(list(1,2),list(3,4))
twoDimArray total := method(
    sum := 0
    self foreach(i,
        i foreach(j,
            sum = sum + j
        )
    )
    return sum
)
(twoDimArray total) println
