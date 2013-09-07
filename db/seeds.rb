# my_array = (1..20).to_a

# 20.times { User.create! name: Faker::Name.name, email: Faker::Internet.email, password: Faker::Lorem.word }

User.create!(name: "John", email: "john@john.com", password_hash:"john")
User.create!(name: "Luisa", email: "luisa@luisa.com", password_hash:"luisa")
User.create!(name: "Lloyd", email: "lloyd@lloyd.com", password_hash:"lloyd")
User.create!(name: "Alex", email: "alex@alex.com", password_hash:"alex")

Survey.create!(name: "Random questions", user_id: 1)
# Survey.create!(name: "Metaphysics", user_id: 2)
# Survey.create!(name: "Colorful", user_id: 3)
# Survey.create!(name: "Hypothetical", user_id: 4)

Question.create!(text: "What's is the best dog in the world?", survey_id: 1)
Question.create!(text: "Why do pigs fly?", survey_id: 1)
Question.create!(text: "What color are David Bowie's eyes?", survey_id: 1)

Choice.create!(question_id: 1, text: "spaniel")
Choice.create!(question_id: 1, text: "beagle")
Choice.create!(question_id: 1, text: "retriever")
Choice.create!(question_id: 2, text: "they don't")
Choice.create!(question_id: 2, text: "they have wings")
Choice.create!(question_id: 2, text: "they are light")
Choice.create!(question_id: 3, text: "blue")
Choice.create!(question_id: 3, text: "brown")
Choice.create!(question_id: 3, text: "each is different")

Response.create!(question_id:1, choice_id:1, user_id:1, survey_id:1)
Response.create!(question_id:2, choice_id:4, user_id:1, survey_id:1)
Response.create!(question_id:3, choice_id:9, user_id:1, survey_id:1)
Response.create!(question_id:1, choice_id:2, user_id:2, survey_id:1)
Response.create!(question_id:2, choice_id:6, user_id:2, survey_id:1)
Response.create!(question_id:3, choice_id:8, user_id:2, survey_id:1)
