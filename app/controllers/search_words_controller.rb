class SearchWordsController < ApplicationController
  before_action :set_search_word, only: [:show, :edit, :update, :destroy]

  # GET /search_words
  # GET /search_words.json
  def index
    @search_words = SearchWord.all
  end

  # GET /search_words/1
  # GET /search_words/1.json
  def show
  end

  # GET /search_words/new
  def new
    @search_word = SearchWord.new
  end

  # GET /search_words/1/edit
  def edit
  end

  # POST /search_words
  # POST /search_words.json
  def create
    @search_word = SearchWord.new(search_word_params)

    respond_to do |format|
      if @search_word.save
        format.html { redirect_to @search_word, notice: 'Search word was successfully created.' }
        format.json { render action: 'show', status: :created, location: @search_word }
      else
        format.html { render action: 'new' }
        format.json { render json: @search_word.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /search_words/1
  # PATCH/PUT /search_words/1.json
  def update
    respond_to do |format|
      if @search_word.update(search_word_params)
        format.html { redirect_to @search_word, notice: 'Search word was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @search_word.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /search_words/1
  # DELETE /search_words/1.json
  def destroy
    @search_word.destroy
    respond_to do |format|
      format.html { redirect_to search_words_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_search_word
      @search_word = SearchWord.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def search_word_params
      params.require(:search_word).permit(:user_id, :word)
    end
end
