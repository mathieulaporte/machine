# machine

TODO: Write a description here

## Installation


Add this to your application's `shard.yml`:

```yaml
dependencies:
  machine:
    github: [your-github-name]/machine
```


## Usage


```crystal
require "machine"
classifier = Machine::Bayes::BayesClasifier.new(["cat", "dog"])
classifier.train("dog", "Dogs are awesome, cats too. I love my dog")
# ...
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
