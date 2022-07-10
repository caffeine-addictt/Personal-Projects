import math, random
from generate import generateNumber
questions = {}

#Square
def __question0(num):
    return {
        'Ask' : num,
        'Ans' : num**2
    }
questions[0] = {
    'Name' : 'Square',
    'Pass' : 'Correct! {Ask}^2 = {Ans}',
    'Fail' : 'Incorrect! {Ask}^2 = {Ans}',
    'Calculate' : __question0
}

#Square Root
def __question1(num):
    return {
        'Ask' : num**2,
        'Ans' : num
    }
questions[1] = {
    'Name' : 'Square Root',
    'Pass' : 'Correct! sqrt({Ask}) = {Ans}',
    'Fail' : 'Incorrect! sqrt({Ask}) = {Ans}',
    'Calculate' : __question1
}

#Cube
def __question2(num):
    return {
        'Ask' : num,
        'Ans' : num**3
    }
questions[2] = {
    'Name' : 'Cube',
    'Pass' : 'Correct! {Ask}^3 = {Ans}',
    'Fail' : 'Incorrect! {Ask}^3 = {Ans}',
    'Calculate' : __question2
}

#Cube Root
def __question3(num):
    return {
        'Ask' : num**3,
        'Ans' : num
    }
questions[3] = {
    'Name' : 'Cube Root',
    'Pass' : 'Correct! cubrt({Ask}) = {Ans}',
    'Fail' : 'Incorrect! cubrt({Ask}) = {Ans}',
    'Calculate' : __question3
}

#Addition
def __question4(num):
    toadd = generateNumber(random.randint(1,9))
    return {
        'Ask' : f'{num} + {toadd}',
        'Ans' : num + toadd
    }
questions[4] = {
    'Name' : 'Calculate',
    'Pass' : 'Correct! {Ask} = {Ans}',
    'Fail' : 'Incorrect! {Ask} = {Ans}',
    'Calculate' : __question4
}

#Subtraction
def __question5(num):
    toadd = generateNumber(random.randint(1,9))
    return {
        'Ask' : f'{num} - {toadd}',
        'Ans' : num - toadd
    }
questions[5] = {
    'Name' : 'Calculate',
    'Pass' : 'Correct! {Ask} = {Ans}',
    'Fail' : 'Incorrect! {Ask} = {Ans}',
    'Calculate' : __question5
}