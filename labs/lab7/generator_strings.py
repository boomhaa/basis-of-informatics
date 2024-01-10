#!/bin/python3

import random


def generator_strings(length, count):
    strings = []
    for i in range(count):
        strings.append(''.join([chr(random.randint(33, 126)) for _ in range(length)]))
    return strings


