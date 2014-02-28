class CheckOutsController < ApplicationController
  before_action :set_check_out, only: [:show, :edit, :update, :destroy]
  before_action :set_check_out, only: [:show, :edit, :update, :destroy]

  # GET /check_outs
  # GET /check_outs.json
  def index
    @check_outs = CheckOut.all
  end

  # GET /check_outs/1
  # GET /check_outs/1.json
  def show
  end

  # POST /check_outs
  # POST /check_outs.json
  def create
    item_id = params[:item_id]
    item_repo = ItemsRepository.new @current_user
    item = item_repo.get_item_entity item_id
    unless item.check_status == ITEM_STATUS.AVAILABLE
      redirect_to '/error?code=error_double_registration'
      return false
    else
      CheckOutsRepository.new.create item_id, @current_user
      @item = item_repo.get_item_entity item_id
      @book = Book.find_by_id @item.book_id
    end
  end

  def scan
    repo = BooksRepository.new
    item = repo.find params[:isbn]
    render text: item.book.title
  end

  def regist
    item_id = params[:item_id]
    repo = ItemsRepository.new, @current_user
    status = repo.get_item_status item_id

    # TODO check status

    check_out = CheckOut.new check_out_params
    check_out.save
    render text: check_out
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_check_out
      @check_out = CheckOut.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def check_out_params
      params.require(:check_out).permit(:item_id, :user_id, :due_date)
    end
end
