def bogo(x):
    count = 0

    while not inorder(x):
        # if sorted, randomly shuffle
        shuffle(x)
        count = count + 1

    # once sorted, return!
    print "Sorted! Attempts: " + count
    return x