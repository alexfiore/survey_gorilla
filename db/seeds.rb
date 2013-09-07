# my_array = (1..20).to_a

# 20.times { User.create! name: Faker::Name.name, email: Faker::Internet.email, password: Faker::Lorem.word }

User.create!(name: "John", email: "john@john.com", password_hash:"john")
User.create!(name: "Luisa", email: "luisa@luisa.com", password_hash:"luisa")
User.create!(name: "Lloyd", email: "lloyd@lloyd.com", password_hash:"lloyd")
User.create!(name: "Alex", email: "alex@alex.com", password_hash:"alex")

Survey.create!(name: "Favorite Dogs", user_id: 1)
Survey.create!(name: "Favorite Dogs", user_id: 2)
Survey.create!(name: "Favorite Dogs", user_id: 3)
Survey.create!(name: "Favorite Dogs", user_id: 4)

Question.create!(text: "Who is the best dog in the world?", survey_id: 1)
Question.create!(text: "Why do pigs fly?", survey_id: 2)
Question.create!(text: "What color are David Bowie's eyes?", survey_id: 3)
Question.create!(text: "Why do elephants stand in rooms?", survey_id: 4)

Choice.create!(question_id: 1, text: "mine")
Choice.create!(question_id: 1, text: "yours")
Choice.create!(question_id: 1, text: "his")
Choice.create!(question_id: 2, text: "all dogs")

Response.create!(question_id:1, choice_id:1, user_id:1, survey_id:1)
Response.create!(question_id:2, choice_id:3, user_id:2, survey_id:2)
Response.create!(question_id:3, choice_id:3, user_id:3, survey_id:3)
Response.create!(question_id:4, choice_id:4, user_id:4, survey_id:4)
