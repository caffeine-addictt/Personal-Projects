--[=[
    Rounds number.

    @parameters
    Number <number> [Required]
    DecimalPlaces <integer> [Optional]

    Returns rounded number
]=]
return function (Number, DecimalPlaces)
    assert(Number, 'Expected number. Got: '..type(Number))
    assert(not DecimalPlaces or math.floor(DecimalPlaces)==DecimalPlaces, 'Expected integer. Got: '..type(DecimalPlaces))

    DecimalPlaces = DecimalPlaces or 0
    return math.floor( (Number * 10^DecimalPlaces) +0.5) / 10^DecimalPlaces
end