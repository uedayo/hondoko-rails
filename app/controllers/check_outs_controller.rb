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

  # GET /check_outs/new
  def new
    @check_out = CheckOut.new
  end

  # GET /check_outs/1/edit
  def edit
  end

  # POST /check_outs
  # POST /check_outs.json
  def create
    item_id = params[:item_id]
    repo = ItemsRepository.new @current_user
    item = repo.get_item_entity item_id
    item
    unless item.check_status == ITEM_STATUS.AVAILABLE
      redirect_to '/error?code=error_double_registration'
      return false
    else
      check_out = CheckOut.new item_id: item_id, user_id: @current_user.id, due_date: Date.today + LOAN_PERIOD
      check_out.save
      @item = repo.get_item_entity item_id
      @book = Book.find @item.book_id
    end
  end

  # PATCH/PUT /check_outs/1
  # PATCH/PUT /check_outs/1.json
  def update
    respond_to do |format|
      if @check_out.update(check_out_params)
        format.html { redirect_to @check_out, notice: 'Check out was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @check_out.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /check_outs/1
  # DELETE /check_outs/1.json
  def destroy
    @check_out.destroy
    respond_to do |format|
      format.html { redirect_to check_outs_url }
      format.json { head :no_content }
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
