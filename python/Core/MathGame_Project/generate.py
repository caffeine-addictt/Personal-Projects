import math, random
def generateNumber(Digits):
    """
    @Description
    Returns a generated number

    @Use Case

    generateNumber(5) -> 5-Digit number
    generateNumber(0.4) -> 1-Digit number
    generateNumber() -> 1-Digit number
    """
    Number = 0
    Digits = (Digits and (Digits<1 or math.floor(Digits) != Digits) and 1) or Digits

    for place in range(0, Digits):
        Number += random.randint(1,9) * 10**place

    return Number