class BrowsesController < ApplicationController
  before_action :set_browse, only: [:show, :edit, :update, :destroy]

  # GET /browses
  # GET /browses.json
  def index
    @browses = Browse.all
  end

  # GET /browses/1
  # GET /browses/1.json
  def show
  end

  # GET /browses/new
  def new
    @browse = Browse.new
  end

  # GET /browses/1/edit
  def edit
  end

  # POST /browses
  # POST /browses.json
  def create
    @browse = Browse.new(browse_params)

    respond_to do |format|
      if @browse.save
        format.html { redirect_to @browse, notice: 'Browse was successfully created.' }
        format.json { render action: 'show', status: :created, location: @browse }
      else
        format.html { render action: 'new' }
        format.json { render json: @browse.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /browses/1
  # PATCH/PUT /browses/1.json
  def update
    respond_to do |format|
      if @browse.update(browse_params)
        format.html { redirect_to @browse, notice: 'Browse was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @browse.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /browses/1
  # DELETE /browses/1.json
  def destroy
    @browse.destroy
    respond_to do |format|
      format.html { redirect_to browses_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_browse
      @browse = Browse.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def browse_params
      params.require(:browse).permit(:user_id, :book_id, :search_word_id)
    end
end
