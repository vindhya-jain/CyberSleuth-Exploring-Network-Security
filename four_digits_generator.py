with open("four_digit_combinations.txt", "w") as f:
    for i in range(10000):
        f.write("{:04d}\n".format(i))

