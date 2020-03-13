class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    init_params = user_params
    # initialize other parameters, subject to change
    init_params[:coins] = 100
    init_params[:chechin_number] = 0
    init_params[:challenge_number] = 0
    
    @user = User.new(init_params)
    if @user.save
      # Handle a successful save.
      log_in @user
      flash[:success] = "Welcome to One Day Challenge!"
      redirect_to @user
      
    else
      render 'new'
    end
  end


  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def participate
    if ParticipateIn.where(user_id: current_user.id, challenge_id: params[:challenge_id]).size >= 1
      flash[:warning] = "You're already in the challenge!"
    else
      ParticipateIn.create(user_id: current_user.id, challenge_id: params[:challenge_id])
      flash[:success] = 'Challenge participated!'
    end
    redirect_to current_user
  end

  def drop
    ParticipateIn.where(user_id: current_user.id, challenge_id: params[:challenge_id]).first.destroy
    flash[:success] = 'Challenge successfully dropped!'
    redirect_to current_user
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :email, :password, :coins, :chechin_number, :challenge_number)
    end
    
    
    # def user_params
    #   params.require(:user).permit(:name, :email, :password,
    #                                :password_confirmation)
    # end
end
