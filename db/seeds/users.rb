#bundle exec rake db:seed:single SEED=users

user = User.new
user.email = 'admin@anime-app.com'
user.password = 'password'
user.password_confirmation = 'password'
user.user_type = 'admin'

user.skip_confirmation!
user.save!

puts "User #{user.email} was successfully created."
