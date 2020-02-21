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

# fake users
User.delete_all
# users = []
# columns = [:name, :email, :password, :password_confirmation, 
#            :coins, :chechin_number, :challenge_number]

# i = 0
# 25.times do
#   # TODO
#   user_name = (Faker::Hacker.noun).capitalize
#   i = i + 1
#   user_email = Faker::Internet.email # use faker to fake an email, make sure it's unqiue
#   user_password = generate(16) # use RandomPassword to fake a password with len = 16
#   user_coins = rand(250) # random coins number from 0 - 250
#   user_checkin_number = rand(100) # non-negative number of checkins
#   user_challenge_number = rand(50) # non-negative number of challenges
#   users.push({ name: user_name, email: user_email, 
#                password: user_password, password_confirmation: user_password,
#                coins: user_coins, chechin_number: user_checkin_number,
#                challenge_number: user_challenge_number })
# end
# User.import columns, users, validate: false
10.times do
  password = generate(16)
  User.create!(name: Faker::Name.name, 
               email: Faker::Internet.email, 
               password: password, 
               password_confirmation: password,
               chechin_number: rand(100),
               challenge_number: rand(50),
               coins: rand(250))
end


# fake challenges
Challenge.delete_all
# link to live google sheet in cvs format
csv_path = "https://docs.google.com/spreadsheets/d/12iXky8WcK-Lbvuxp6eeOxoL5aAlSNinPKJrisbyq_Gw/gviz/tq?tqx=out:csv"
csv = CSV.parse(open(csv_path), :headers=>true)
csv.each do |row|
  Challenge.create!(name: row["tittle"], 
                    category: row["category"], 
                    description: row['description'], 
                    coins: row["coins"].to_i,
                    participant_number: 0,
                    failed_number: 0,
                    duration: row["duration"].to_i,
                    deadline: Faker::Date.in_date_period(year: 2020, month: 5 + rand(4)),
                    pic_link: row["pic"])
end

# challenges = []
# columns = [:name, :category, :description, :coins, :participant_number, 
#               :failed_number, :duration, :deadline
#             ]

# 25.times do
#   challenge_name = (Faker::Hacker.ingverb + " " + Faker::Hacker.noun + "s").capitalize
#   # TODO
#   challenge_category = "Cate"# use faker to fake an category
#   challenge_desc = "A"# use faker to fake an discreption
#   challenge_coins = 1# random integer coins
#   challenge_part_num = 1# random integer participat number
#   challenge_fail_num = 1# random integer failed number

#   # make sure the duration and deadline make sense
#   challenge_deadline = Time.now# use faker to fake an datetime deadline
#   challenge_duration = 1# random integer duration# 
  
#   ch = { name: challenge_name, category: challenge_category, description: challenge_desc,
#                     coins: challenge_coins,
#                     participant_number: challenge_part_num, failed_number: challenge_fail_num,
#                     duration: challenge_duration, deadline: challenge_deadline
#              }
#   puts ch
#   challenges.push(ch)
# end
# Challenge.import columns, challenges, validate: false


# fake participate_in
ParticipateIn.delete_all
participate_ins = []
columns = [:user_id, :challenge_id, :continuous_check_in, :failed, :finished]

10.times do
  user = User.all.sample.id,
  challenge = Challenge.all.sample.id
  # TODO check if no duplicate user-challenge pair
  check_in = 1# random interger, make sure <= challenge duration
  part_failed = 1 # boolean
  part_finished = 1# boolean, must be true if check-in = challenge duration
           # must be false if failed = true
  participate_ins.push({user_id: user, challenge_id: challenge, continuous_check_in: check_in,
                        failed: part_failed, finished: part_finished
                  })
end
ParticipateIn.import columns, participate_ins, validate: false


# fake histories
History.delete_all
histories = []
columns = [:user_id, :challenge_id, :continuous_check_in, :finished]

10.times do
  user = User.all.sample.id,
  challenge = Challenge.all.sample.id
  # TODO check if no duplicate user-challenge pair, and not in participate_in
  check_in = 1# random interger, make sure <= challenge duration
  part_finished = 1# boolean, must be true if check-in = challenge duration

  histories.push({user_id: user, challenge_id: challenge, continuous_check_in: check_in,
                        finished: part_finished
                  })
end
History.import columns, histories, validate: false


# fake favorites
Favorite.delete_all
favorites = []
columns = [:user_id, :challenge_id]

10.times do
  user = User.all.sample.id,
  challenge = Challenge.all.sample.id
  # TODO check if no duplicate user-challenge pair, and not in participate_in nor histories
  favorites.push({user_id: user, challenge_id: challenge})
end

Favorite.import columns, favorites, validate: false
