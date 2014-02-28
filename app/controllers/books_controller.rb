class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  # GET /books
  # GET /books.json
  def index
    if query = params[:q].presence
      searches_repo = SearchesRepository.new @current_user
      search = searches_repo.save query
      @query_id = search.id
      books_repo = BooksRepository.new
      @books = books_repo.find_by_search_words query
      @title = t('view.books_search_result', key: query)
    else
      @books = Book.all
      @title = t('view.books_index')
    end
  end

  # GET /books/1
  # GET /books/1.json
  def show
    query_id = params[:qid].presence
    Browse.create user_id: @current_user.id, book_id: @book.id, search_id: query_id
    repo = ItemsRepository.new @current_user
    @items = repo.get_item_entities_by_isbn params[:id]
  end

  # GET /books/new
  def new
    @book = Book.new
  end

  # GET /books/1/edit
  def edit
  end

  # POST /books
  # POST /books.json
  def create
    @book = Book.new(book_params)

    respond_to do |format|
      if @book.save
        format.html { redirect_to @book, notice: 'Book was successfully created.' }
        format.json { render action: 'show', status: :created, location: @book }
      else
        format.html { render action: 'new' }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /books/1
  # PATCH/PUT /books/1.json
  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to @book, notice: 'Book was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1
  # DELETE /books/1.json
  def destroy
    @book.destroy
    respond_to do |format|
      format.html { redirect_to books_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find params[:id]
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def book_params
      params.require(:book).permit(:title, :author, :manufacturer, :small_image, :medium_image, :detail_page_url, :category_id)
    end
end
