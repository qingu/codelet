#!/user/bin/env python

class Person:
    name = "Jane Doe"
    age = 10

    def __init__(self):
        self.name = "WetWan"
        self.age = 20


person = Person.__new__(Person)
print(f"Person's name: {person.name}, age: {person.age}")
