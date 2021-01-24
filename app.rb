require_relative 'config/environment'
require_relative 'models/text_analyzer.rb'

class App < Sinatra::Base
  get '/' do
    erb :index
  end

  post '/' do
    text_from_user = params[:user_text]
    text = TextAnalyzer.new(text_from_user)
    @word_count = text.word_counter
    @vowel_count = text.vowel_counter
    @consonant_count = text.consonant_counter
    @most_common_letter = text.most_common_letter[0]
    @common_letter_count = text.most_common_letter[1]
    erb :results
  end
end
