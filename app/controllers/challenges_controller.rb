class ChallengesController < ApplicationController
  before_action :set_challenge, only: [:show, :edit, :update, :destroy]

  # GET /challenges
  # GET /challenges.json
  def index
    @challenges = Challenge.all
  end

  # GET /challenges/1
  # GET /challenges/1.json
  def show
  end

  def search
    text = params[:q]
    puts text
    challenge = params[:challenge_cate]
    puts challenge
    if text != ''
      if challenge == "1"
        @challenges = current_user.challenges.where('lower(name) like ?', "%#{text.downcase}%")
      elsif challenge == "2"
        @challenges = current_user.his_challenges.where('lower(name) like ?', "%#{text.downcase}%")
      else
        @challenges = current_user.fav_challenges.where('lower(name) like ?', "%#{text.downcase}%")
      end
      if @challenges.size == 0
        redirect_to current_user
        flash[:alert] = "challenge cannot be found"
      else
        render 'users/search'
      end
    else
      flash[:alert] = "Cannot leave as blank"
      redirect_to current_user
    end


  end

  # GET /challenges/new
  def new
    @challenge = Challenge.new
  end

  # GET /challenges/1/edit
  def edit
  end

  # POST /challenges
  # POST /challenges.json
  def create
    @challenge = Challenge.new(challenge_params)

    respond_to do |format|
      if @challenge.save
        format.html { redirect_to @challenge, notice: 'Challenge was successfully created.' }
        format.json { render :show, status: :created, location: @challenge }
      else
        format.html { render :new }
        format.json { render json: @challenge.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /challenges/1
  # PATCH/PUT /challenges/1.json
  def update
    respond_to do |format|
      if @challenge.update(challenge_params)
        format.html { redirect_to @challenge, notice: 'Challenge was successfully updated.' }
        format.json { render :show, status: :ok, location: @challenge }
      else
        format.html { render :edit }
        format.json { render json: @challenge.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /challenges/1
  # DELETE /challenges/1.json
  def destroy
    @challenge.destroy
    respond_to do |format|
      format.html { redirect_to challenges_url, notice: 'Challenge was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_challenge
      @challenge = Challenge.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def challenge_params
      params.require(:challenge).permit(:name, :category, :description, :coins, :duration, :participant_number, :failed_number, :deadline)
    end
end
