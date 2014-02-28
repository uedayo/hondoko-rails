class Search < ActiveRecord::Base
  belongs_to :user
  belongs_to :search_word
end
