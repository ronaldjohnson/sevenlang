#!/usr/bin/env io

generatedRandomNumber := Date now asNumber ceil % 100
guessAccuracy := -1

getInput := method(
    prompt := "Guess a number between 1 and 100: "
    Protos ReadLine prompt = prompt
    Protos ReadLine readLine() asNumber
)

doesInputMatch := method(guess,
    if(guess != generatedRandomNumber) then(return false)
    return true
)

giveHint := method(guess,
    previousGuessAccuracy := guessAccuracy
    guessAccuracy = (guess - generatedRandomNumber) abs
    if(previousGuessAccuracy < 1) then(return "")
    if(guessAccuracy > previousGuessAccuracy) then(
        return "\tcolder :("
    ) else(
        return "\thotter :)"
    )
)

for(guess_count, 1, 10,
    guess := getInput()
    if(doesInputMatch(guess)) then(
        "Correct!" println
        System exit
    ) else(
        giveHint(guess) println
    )
)
"You failed to guess the correct number" println
