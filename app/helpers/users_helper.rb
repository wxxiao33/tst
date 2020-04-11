module UsersHelper
    # Returns the Gravatar for the given user.
  def gravatar_for(user)
    gravatar_id  = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    image_tag(gravatar_url, alt: user.name, class: "gravatar")
  end

  def welcome(user)
  	if current_user?(user)
  		"A Warm Welcome, #{user.name}!"
  	else
  		user.name
  	end
  end

  def display_by(key, users)
    case key
    when "coins"
      users.sort_by { |user| -user.coins }
    when "check_ins"
      users.sort_by { |user| -user.chechin_number }
    when "challenges"
      users.sort_by { |user| -user.challenge_number }
    end
  end

end