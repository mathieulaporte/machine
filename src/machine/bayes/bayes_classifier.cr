module Machine
  module Bayes
    class Category
      def initialize
        @words = Hash(String, Int32).new(0)
        @word_count = 0
      end

      def words
        @words
      end

      def word_count
        @word_count
      end

      def word_count=(val)
        @word_count = val
      end
    end

    class BayesClasifier
      def initialize(@categories_names : Array(String))
        @categories = {} of String => Category
        @category_counts = Hash(String, Int32).new(0)
        categories_names.each do |name|
          @categories[name] = Category.new
        end
      end

      def categories
        @categories
      end

      def category_counts
        @category_counts
      end

      def train(category : String, text : String)
        @category_counts[category] += 1
        count_words_occurence(text).each do |word, count|
          @categories[category].words[word] += count
          @categories[category].word_count = @categories[category].word_count += count
        end
      end

      def classifications(text)
        score = {} of String => Float64
        word_hash = count_words_occurence(text)
        training_count = @category_counts.values.reduce { |mem, v| mem + v }.to_f
        @categories.each do |category_name, category|
          score[category_name] = 0.0
          total = (category.word_count || 1).to_f
          word_hash.each do |word, _count|
            s = category.words.keys.includes?(word) ? category.words[word] : 0.1
            score[category_name] += Math.log(s / total)
          end
          s = @category_counts.has_key?(category_name) ? @category_counts[category_name] : 0.1
          score[category_name] += Math.log(s / training_count)
        end
        score
      end

      def classify_with_score(text : String)
        classifications(text).map { |k, v| {k => -v} }.sort_by { |a| a.values[0] }[0]
      end

      def classify(text : String)
        classify_with_score(text).keys.first
      end

      def count_words_occurence(text)
        hash = Hash(String, Int32).new(0)
        text.split(" ").each do |word|
          hash[word] += 1
        end
        hash
      end
    end
  end
end
