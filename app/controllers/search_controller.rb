class SearchController < ApplicationController

  def find_by_word value
    repo = SerchRepository.new
    repo.find_by_keywords value
  end
end
