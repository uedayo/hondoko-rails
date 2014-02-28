class SearchesRepository
  def initialize current_user
    @current_user = current_user
  end

  def save query
    search_word = SearchWord.find_by_word query
    unless search_word
      search_word = SearchWord.create word: query
    end
    Search.create user_id: @current_user.id, search_word_id: search_word.id
  end
end