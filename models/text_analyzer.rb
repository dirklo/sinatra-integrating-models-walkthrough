# Your TextAnalyzer model code will go here.
class TextAnalyzer 
    attr_accessor :text

    def initialize(text)
        @text = text
    end

    def word_counter
        text.split(" ").count
    end

    def vowel_counter
        text.downcase.split("").filter{|l| ["a", "e", "i", "o", "u"].include?(l)}.count
    end

    def consonant_counter
        text.gsub(" ", "").downcase.split("").filter{|l| !["a", "e", "i", "o", "u"].include?(l)}.count
    end

    def most_common_letter
        array = text.gsub(" ", "").downcase.split("")
        most_common_count = 0
        most_common_letter = ""
        array.each_with_index do |l, i|
            current = array.count(array[i])
            if current > most_common_count
                most_common_count = current
                most_common_letter = array[i]
            end
        end
        [most_common_letter.upcase, most_common_count]
    end
end