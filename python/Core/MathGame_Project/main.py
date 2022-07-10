import math, time, random
from questions import questions
from generate import generateNumber

sessionCount = 0

#HOW TO PLAY
"""
    HOW TO PLAY

    A series of mathematical questions will be asked. Try your best to answer them!
    \n
"""

while True:
    sessionCount += 1
    correctAnswers = 0
    questionNumber = 1

    #Ask for Num of questions
    numberOfquestions = input('How many questions would you like?\n')

    if numberOfquestions.isnumeric():
        numberOfquestions = int(numberOfquestions)
    else:
        numberOfquestions = 10

    sessionStartTime = time.time()
    print(f'Okay! Number Of questions: {numberOfquestions}\n')
    print(f'/////////////////// Session {sessionCount} ///////////////////\n')

    while questionNumber <= numberOfquestions:
        passOrFail = ''
        questionStartTime = time.time()
        questionPriInfo = questions[random.randint(0, len(questions)-1)]
        questionSecInfo = questionPriInfo['Calculate'](generateNumber(2))

        print('--------------------------------------')
        print(f'Question {questionNumber}/{numberOfquestions}\n')
        answer = input(questionPriInfo['Name'] + ': ' + str(questionSecInfo['Ask']) + '\n')

        if str(questionSecInfo['Ans']) == answer:
            correctAnswers += 1
            passOrFail = 'Pass'
        else:
            passOrFail = 'Fail'

        print(questionPriInfo[passOrFail].format(
            Ask = questionSecInfo['Ask'],
            Ans = questionSecInfo['Ans']
        )+'\n')
        print(f'Answered in {math.floor((time.time() - questionStartTime)*1000)/1000}s \n')
        print('--------------------------------------')

        questionNumber += 1

    print(f'Session Details:\nAnswered {correctAnswers}/{numberOfquestions} questions correctly in {math.floor((time.time() - sessionStartTime)*1000)/1000}s')
    print('/////////////////// End Session ///////////////////')