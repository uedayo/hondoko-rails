class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  # GET /items
  # GET /items.json
  def index
    @items = Item.all
    @check_out = CheckOut.all
    @check_in = CheckIn.all
  end

  # GET /items/1
  # GET /items/1.json
  def show
  end

  # GET /items/new
  def new
    book_id = params[:book_id]
    if @book = Book.where(id: book_id).first.presence
      @count = Item.where(book_id: @book.id).count
      @item = Item.new book_id: book_id
    else
      redirect_to new_book_path
      flash[:notice] =  t('view.book_master_empty_message')
    end
  end

  # GET /items/1/edit
  def edit
  end

  # POST /items
  # POST /items.json
  def create
    @item = Item.new(item_params)
    unless @item.volume.present?
      count = Item.where(book_id: @item.book_id).count
      @item.volume = count + 1
    end

    respond_to do |format|
      if @item.save
        book = Book.where(id: @item.book_id).first
        format.html {
          redirect_to book_path(book.isbn)
          flash[:success] =  t('view.create_item_done_message')
        }
        format.json { render action: 'show', status: :created, location: @item }
      else
        format.html { render action: 'new' }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to @item, notice: t('view.edit_book_done_message') }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to items_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.require(:item).permit(:book_id, :volume, :area_id)
    end
end
