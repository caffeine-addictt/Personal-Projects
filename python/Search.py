from argparse import ArgumentTypeError

#Linear Search
# 0(n)
def linear_search(*kwargs):
    """
    Linearly Search an array/dict/list for a value.
    Returns the index/key.

    >> Examples <<

    Dictionary:
    linear_search({"this", "is", "a", "dictionary"}, "is") -> 1
    linear_search({
        "index1" : "this",
        "index2" : "is",
        "index3" : "a",
        "index4" : "dictionary"
    }, "a") -> 2

    List:
    linear_search(["this", "is", "a", "list"], "a") -> 2

    Array:
    linear_search("this", "is", "an", "array", "an") -> 2

    Tuple:
    linear_search(("This", "is", "a", "tuple"), "is") -> 1
    
    """
    if len(kwargs) < 2:
        raise ArgumentTypeError('Expected [DATA] and [VALUE]. GOT: (' + ''.join( '' + x for x in kwargs) + ')')

    Value = kwargs[-1]
    dataset = {}

    if (len(kwargs) == 2) and isinstance(kwargs[0], dict):
        dataset = kwargs[0]
    elif (len(kwargs) == 2) and (isinstance(kwargs[0], list) or isinstance(kwargs[0], tuple)):
        for x in kwargs[0]:
            dataset[str(len(dataset))] = x
    elif (len(kwargs) == 2):
        raise ArgumentTypeError('Invalid Data Structure!')
    else:
        for x in kwargs[:len(kwargs)-1]:
            dataset[str(len(dataset))] = x

    for i,v in dataset.items():
        if v == Value:
            return i

    return False