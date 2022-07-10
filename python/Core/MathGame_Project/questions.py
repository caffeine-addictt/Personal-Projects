questions = {}

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