class PagesController < ApplicationController
  def home
    # FIXME navbar js glitches (Kuan-Yu)
    # FIXME navbar scroll to section doesn't work (Kuan-Yu)
    # FIXME about icon not showing correctly (Kuan-Yu)
    # FIXME portfolio section (Kuan-Yu)
    # FIXME team description
    # FIXME sign up form position (Kuan-Yu)
    # FIXME sign up form error redirection (Kuan-Yu)
    @user = User.new
  end

  def about
  end

  def search
  end

  def result
    current_user = User.find(params[:user_id])
    puts current_user
    text = params[:q]
    puts text
    challenge = params[:challenge_cate]
    puts challenge

    if challenge == "1"
      if text != ''
        @challenges = current_user.challenges.where('lower(name) like ?', "%#{text.downcase}%")
      else
        @challenges = current_user.challenges
      end
    elsif challenge == "2"
      if text != ''
        @challenges = current_user.his_challenges.where('lower(name) like ?', "%#{text.downcase}%")
      else
        @challenges = current_user.his_challenges
      end
    else
      if text != ''
        @challenges = current_user.fav_challenges.where('lower(name) like ?', "%#{text.downcase}%")
      else
        @challenges = current_user.fav_challenges
      end
    end
    if @challenges.size == 0
      # p "="*10
      # p @challenges
      # p "redirect1"
      # p "="*10
      # redirect_to root_path
      # flash[:alert] = "challenge cannot be found"
      # FIXME flash persists (kaunyu)
      redirect_to current_user
    else
      render 'users/show'
    end
  end


end
