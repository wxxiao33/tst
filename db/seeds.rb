# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
require 'random/password'
require 'csv'
require 'open-uri'
include RandomPassword


# define parameters
user_num = 30 # number of users in the database
participate_max = 10 # number of MAX actively-envolved challenges for each user
history_max = 10 # number of MAX finished challenges for each user
favorite_max = 5 # number of MAX favorite challenges for each user


################# fake users #################
User.delete_all
user_num.times do
  password = generate(16)
  User.create!(name: Faker::Name.name, 
               email: Faker::Internet.email, 
               password: password, 
               password_confirmation: password,
               chechin_number: rand(100),
               challenge_number: rand(50),
               coins: rand(250))
end

################# fake challenges #################
Challenge.delete_all
# link to live google sheet in cvs format
csv_path = "https://docs.google.com/spreadsheets/d/12iXky8WcK-Lbvuxp6eeOxoL5aAlSNinPKJrisbyq_Gw/gviz/tq?tqx=out:csv"
csv = CSV.parse(open(csv_path), :headers=>true)

# take 3/4 challenges to be currently active challenges (deadline -> future date)
active_challenges = []
csv[(0...(csv.size*3/4))].each do |row|
  active_challenges << Challenge.create!(
    name: row["tittle"], 
    category: row["category"], 
    description: row['description'], 
    coins: row["coins"].to_i,
    participant_number: 0,
    failed_number: 0,
    duration: row["duration"].to_i,
    deadline: Faker::Date.in_date_period(year: 2020, month: 5 + rand(4)),
    pic_link: row["pic"])
end

# take 1/4 challenges to be archived challenges (deadline -> past date)
archived_challenges = []
csv[((csv.size*3/4)..csv.size)].each do |row|
  archived_challenges << Challenge.create!(
    name: row["tittle"], 
    category: row["category"], 
    description: row['description'], 
    coins: row["coins"].to_i,
    participant_number: 0,
    failed_number: 0,
    duration: row["duration"].to_i,
    deadline: Faker::Date.backward(days: 14),
    pic_link: row["pic"])
end


################# fake participate_ins, histories and favorites #################
ParticipateIn.delete_all

def get_new_challenge used_challenges, all_challenges
  # get a new challenge from all_challenge but not in used_challenge
  challenge = all_challenges.sample
  while used_challenges.include? challenge.id
    challenge = all_challenges.sample
  end
  used_challenges << challenge.id
  return used_challenges, challenge
end

users = User.all
users.each do |user|
  used_challenges = []

  # create user's participate_ins
  rand(participate_max).times do
    # pick a new challenge from active_challenges
    used_challenges, challenge = get_new_challenge(used_challenges, active_challenges)
    # create corresponding participate_in object
    check_in = rand(challenge.duration + 1)
    ParticipateIn.create!(
      user_id: user.id,
      challenge_id: challenge.id,
      continuous_check_in: check_in,
      failed: [true, false].sample,
      finished: check_in == challenge.duration ? true : false)
  end

  # create user's favorites
  rand(favorite_max).times do
    # pick a new challenge from active_challenges
    used_challenges, challenge = get_new_challenge(used_challenges, active_challenges)
    # create corresponding favorite object
    Favorite.create!(
      user_id: user.id,
      challenge_id: challenge.id,
  end

  # create user's histories
  rand(history_max).times do
    # pick a new challenge from active_challenges
    used_challenges, challenge = get_new_challenge(used_challenges, archived_challenges)
    # create corresponding participate_in object
    check_in = rand(challenge.duration + 1)
    ParticipateIn.create!(
      user_id: user.id,
      challenge_id: challenge.id,
      continuous_check_in: check_in,
      failed: [true, false].sample,
      finished: check_in == challenge.duration ? true : false)
  end
end
