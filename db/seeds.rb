# my_array = (1..20).to_a

# 20.times { User.create! name: Faker::Name.name, email: Faker::Internet.email, password: Faker::Lorem.word }

User.create!(name: "John", email: "john@john.com", password_hash:"john")

Survey.create!(name: "Favorite Dogs", user_id: 1) 

Question.create!(text: "Who is the best dog in the world?", survey_id: 1)

Choice.create!(question_id: 1, text: "mine")

Response.create!(question_id:1, choice_id:1, user_id:1, survey_id:1)
