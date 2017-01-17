# machine

Simple machine learning algorithm.
Status : working on decision tree.

## Installation


Add this to your application's `shard.yml`:

```yaml
dependencies:
  machine:
    github: mathieulaporte/machine
```

## Usage

```crystal
require "machine"

classifier = Machine::Bayes::BayesClasifier.new(["cat", "dog"])

classifier.train("dog", "dogs are awesome")
classifier.train("dog", "The domestic dog Canis lupus familiaris or Canis familiaris is a member of genus Canis canines that forms part of the wolf-like canids and is the most widely abundant carnivore.")
classifier.train("dog", "The dog and the extant gray wolf are sister taxa with modern wolves not closely related to the wolves that were first domesticated.[8][9] The dog was the first domesticated species[9][10] and has been selectively bred over millennia for various behaviors, sensory capabilities, and physical attributes.")
classifier.train("dog", "Their long association with humans has led dogs to be uniquely attuned to human behavior and they are able to thrive on a starch-rich diet that would be inadequate for other canid species. Dogs vary widely in shape, size and colours. Dogs perform many roles for people, such as hunting, herding, pulling loads, protection, assisting police and military, companionship and, more recently, aiding handicapped individuals. This influence on human society has given them the sobriquet man's best friend.")

classifier.train("cat", "cats are awesome too")
classifier.train("cat", "The domestic cat Latin Felis catus is a small, typically furry, carnivorous mammal. They are often called house cats when kept as indoor pets or simply cats when there is no need to distinguish them from other felids and felines. Cats are often valued by humans for companionship and for their ability to hunt vermin. There are more than 70 cat breeds; different associations proclaim different numbers according to their standards.")
classifier.train("cat", "cats are similar in anatomy to the other felids, with a strong, flexible body, quick reflexes, sharp retractable claws, and teeth adapted to killing small prey. Cat senses fit a crepuscular and predatory ecological niche. Cats can hear sounds too faint or too high in frequency for human ears, such as those made by mice and other small animals. They can see in near darkness. Like most other mammals, cats have poorer color vision and a better sense of smell than humans. Cats, despite being solitary hunters, are a social species and cat communication includes the use of a variety of vocalizations mewing, purring, trilling, hissing, growling, and grunting, as well as cat pheromones and types of cat-specific body language.")

puts classifier.classify("test about cats")
# cat
puts classifier.classify("test about dogs")
# dog
puts classifier.classify("best friend")
# dog
puts classifier.classify("live in house")
# cat
puts classifier.classify("a kind of felid")
# cat
```

## Development

TODO: Write development instructions here

## Contributing

1. Fork it ( https://github.com/[your-github-name]/machine/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request

## Contributors

- [[mathieulaporte]](https://github.com/[mathieulaporte]) Mathieu Laporte - creator, maintainer
