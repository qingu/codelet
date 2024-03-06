class Person:
    def __new__(cls, name, age):
        print("Creating a new Person object")
        instance = super().__new__(cls)
        return instance

    def __init__(self, name, age):
        print("Initializing the Person object")
        self.name = name
        self.age = age


person = Person("John Doe", 30)
print(f"Person's name: {person.name}, age: {person.age}")

person2 = Person.__new__(Person, "WetWan", 20)
person2.__init__("WetWan", 20)
print(f"Person2's name: {person2.name}, age: {person2.age}")
