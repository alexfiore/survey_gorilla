
# survey creation
get '/surveys/new' do
  erb :new_survey
end

post '/surveys' do
  # "create survey title"
  puts params
  @survey = Survey.new(name: params[:name])
  if @survey.save
    @confirmation = "You made the survey '#{@survey.name}'!"
    erb :_new_question, layout: false
  else
    @errors = @survey.errors.full_messages
    erb :new_survey
  end
end

post '/surveys/:survey_id/questions' do
  puts params
  @question = Question.create(text: params[:question], survey_id: survey_id)
  erb :_new_choice, layout: false
end

post 'surveys/:question_id/choices' do
  # params[:choices].each do |key, value|
  puts params
  Choice.create!(text: params[:text], question_id: question_id)
  # end
  erb :_new_choice, layout: false
end

get '/surveys/:id' do
  # "shows the survey for the user to take"
  @survey = Survey.find_by_id(params[:id])
  @question = Question.where("survey_id = ?", @survey.id)
  erb :survey_page
end

post '/surveys/:survey_id/responses' do
  # "creates responses in database and goes back to surveys page"
  40.times {print "*"}
  p params

  params[:question].each do |key, value|
    Response.create!(choice_id: value, survey_id: params[:survey_id], user_id: session[:id], question_id: key)
  end
  redirect "/surveys"
end

get '/surveys/:survey_id/stats' do
  "shows the stats for a particular survey"
  erb :stats
end


delete '/surveys/:survey_id' do
  Survey.find(params[:survey_id]).destroy  
  redirect '/surveys'
end
