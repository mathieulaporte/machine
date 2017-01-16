require "./machine/**"

module Machine
end

puts Machine::DecisionTree::DataSet.new(
  [
    Machine::DecisionTree::FeatVector.new("yes", ["1", "1"]),
    Machine::DecisionTree::FeatVector.new("yes", ["1", "1"]),
    Machine::DecisionTree::FeatVector.new("no", ["1", "0"]),
    Machine::DecisionTree::FeatVector.new("no", ["0", "1"]),
    Machine::DecisionTree::FeatVector.new("no", ["0", "1"]),
  ]
).split(0, "1").data
