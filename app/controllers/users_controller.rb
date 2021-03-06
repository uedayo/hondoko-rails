class UsersController < ApplicationController
  skip_before_filter :login_required, only: [:index, :new, :create]
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.includes(:division)
  end

  # GET /users/1
  # GET /users/1.json
  def show
    repo = ItemsRepository.new @user
    @items = repo.get_items_on_user_by_user_id
  end

  # GET /users/new
  def new
    @user = User.new
    @user.email = EXAMPLE_EMAIL
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    @user.image_url ||= TWITTER_IMAGE

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: t('view.create_user_done_message') }
        format.json { render action: 'show', status: :created, location: @user }
      else
        format.html { render action: 'new' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        sign_out
        format.html { redirect_to @user, notice: t('view.edit_user_done_message') }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def twitter_image
    twitter_user = Twitter.find params[:screen_name]
    @twitter_image = twitter_user["profile_image_url"].gsub('_normal', '')
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:last_name_kanji, :first_name_kanji, :last_name_hiragana, :first_name_hiragana, :last_name_roman, :first_name_roman, :email, :screen_name, :image_url, :division_id)
    end
end
