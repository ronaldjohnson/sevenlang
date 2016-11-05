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

div := Number getSlot("/")
Number / = method(denominator,
    (denominator == 0) ifTrue(
        return 0
    ) ifFalse(
        return (self div denominator)
    )
)

4 / 0 println
#4 / 2 println

Number / = getSlot("div")

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

"4)" println

List myAverage := method(
    total := 0
    self foreach(i,
        (i type != Number type) ifTrue(
            Exception raise("Only numbers are valid for this operation")
        )
        total := i + total
    )
    return (total / (self size) );
)
myList := list("a", "e", "i", "o", "u")
e := try(
    myList myAverage()
)
e catch(Exception,
    writeln(e coroutine backTraceString)
)

anotherList := list(1, 2, 3, 4)
anotherList myAverage() println
# if there are no numbers in the list or if any of the values
# are not a number, an exception is thrown.

"5)" println

Dim := Object clone
Dim dim := method(x, y,
    self thisList := List clone
    for(i, 1, y,
        thisList append(List clone setSize(x))
    )
    return self
)
Dim set := method(x, y, value,
    thisList at(y - 1) atPut(x - 1, value)
    self
)
Dim get := method(x, y,
    return thisList at(y - 1) at(x - 1)
)

twobytwo := Dim clone dim(2, 2)
twobytwo set(2, 2, "hello")
twobytwo get(2, 2) println

"6)" println

Dim transpose := method(
    x := thisList at(0) size
    y := thisList size
    transposedList := Dim clone dim(y, x)
    thisList foreach(j, v,
        v foreach(i, w,
            transposedList set(j + 1, i + 1, w)
        )
    )
    transposedList
)

matrix := Dim clone dim(2, 3)
matrix set(1, 1, "one") set(1, 2, "two") set(1, 3, "three")
matrix set(2, 1, "four") set(2, 2, "five") set(2, 3, "six")
new_matrix := matrix transpose()
(new_matrix get(2, 1) == matrix get(1, 2)) println
