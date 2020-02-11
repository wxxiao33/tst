# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# fake users
User.delete_all
users = []
columns = [:name, :email, :password, :coins, :chechin_number, :challenge_number]

i = 0
25.times do
  # TODO
  user_name = (Faker::Hacker.noun).capitalize
  i = i + 1
  user_email = "#{i}"# use faker to fake an email, make sure it's unqiue
  user_password = "#{i}"# faker a password, make sure it's unique
  user_coins = i # non-negative number of coins
  user_checkin_number = i# non-negative number of checkins
  user_challenge_number = i# non-negative number of checkins
  users.push({ name: user_name, email: user_email, password: user_password,
               coins: user_coins, chechin_number: user_checkin_number,
               challenge_number: user_challenge_number 
        })
end
User.import columns, users, validate: false

# fake challenges
Challenge.delete_all
challenges = []
columns = [:name, :category, :description, :coins, :participant_number, 
              :failed_number, :duration, :deadline
            ]

25.times do
  challenge_name = (Faker::Hacker.ingverb + " " + Faker::Hacker.noun + "s").capitalize
  # TODO
  challenge_category = "Cate"# use faker to fake an category
  challenge_desc = "A"# use faker to fake an discreption
  challenge_coins = 1# random integer coins
  challenge_part_num = 1# random integer participat number
  challenge_fail_num = 1# random integer failed number

  # make sure the duration and deadline make sense
  challenge_deadline = Time.now# use faker to fake an datetime deadline
  challenge_duration = 1# random integer duration# 
  
  ch = { name: challenge_name, category: challenge_category, description: challenge_desc,
                    coins: challenge_coins,
                    participant_number: challenge_part_num, failed_number: challenge_fail_num,
                    duration: challenge_duration, deadline: challenge_deadline
             }
  puts ch
  challenges.push(ch)
end
Challenge.import columns, challenges, validate: false


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
