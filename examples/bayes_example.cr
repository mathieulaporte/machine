require "../src/machine"

classifier = Machine::Bayes::BayesClasifier.new(["cat", "dog"])

classifier.train("dog", "Dogs are awesome, cats too. I love my dog")
classifier.train("cat", "Cats are more preferred by software developers. I never could stand cats. I have a dog")
classifier.train("dog", "My dog's name is Willy. He likes to play with my wife's cat all day long. I love dogs")
classifier.train("cat", "Cats are difficult animals, unlike dogs, really annoying, I hate them all")
classifier.train("dog", "So which one should you choose? A dog, definitely.")
classifier.train("cat", "The favorite food for cats is bird meat, although mice are good, but birds are a delicacy")
classifier.train("dog", "A dog will eat anything, including birds or whatever meat")
classifier.train("cat", "My cat's favorite place to purr is on my keyboard")
classifier.train("dog", "My dog's favorite place to take a leak is the tree in front of our house")

puts classifier.classify("This test is about cats.")
