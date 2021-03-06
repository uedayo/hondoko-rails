class CheckInsController < ApplicationController
  before_action :set_check_in, only: [:show, :edit, :update, :destroy]

  # GET /check_ins
  # GET /check_ins.json
  def index
    @check_ins = CheckIn.all
  end

  # GET /check_ins/1
  # GET /check_ins/1.json
  def show
  end

  # POST /check_ins
  # POST /check_ins.json
  def create
    item_id = params[:item_id]
    repo = ItemsRepository.new @current_user
    item = repo.get_item_on_book_by_item_id item_id
    unless item.check_status == ITEM_STATUS.OWED_BY_CURRENT_USER
      redirect_to '/error?code=error_double_registration'
      return false
    else
      CheckInsRepository.new.create item.check_out_id
      @item = repo.get_item_on_book_by_item_id item_id
      @book = Book.find_by_id @item.book_id
    end
  end

  def scan
    repo = BooksRepository.new
    item = repo.find params[:isbn]
    render text: item.book.title
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_check_in
      @check_in = CheckIn.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def check_in_params
      params.require(:check_in).permit(:check_out_id)
    end
end
