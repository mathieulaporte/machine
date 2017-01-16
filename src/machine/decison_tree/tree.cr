module Machine
  module DecisionTree
    struct FeatVector
      getter label, data

      def initialize(@label : String, @data : Array(String))
      end
    end

    class DataSet
      getter data, vector_size

      def initialize(@data : Array(FeatVector))
        @vector_size = @data.first.data.size
      end

      def shannon_entropy : Int32
        return nil unless data
        num_entries = data.size.to_f
        label_count = data.group_by { |e| e.label }.map do |label, values|
          {label => values.size}
        end.reduce({} of String => Int32) { |a, b| a.merge(b) }
        shannon_ent = 0
        label_count.each do |label, count|
          prob = count / num_entries
          shannon_ent -= prob * Math.log2(prob)
        end
        shannon_ent
      end

      def split(index : Int32, value : String) : DataSet
        vectors = data.map do |feat_vector|
          if feat_vector.data[index] == value
            new_vector_data = feat_vector.data.clone
            new_vector_data.delete_at(index)
            FeatVector.new(feat_vector.label, new_vector_data)
          end
        end.compact
        DataSet.new(vectors)
      end

      def choose_best_feature_to_split
        feature_count = data.count
        base_entropy = shannon_entropy
        vector_size.times do |i|
        end
      end
    end

    class Node
    end

    class Tree
      def initialize(@root : Machine::DecisionTree::Node)
      end
    end
  end
end
