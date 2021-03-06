get '/surveys/new' do
  erb :new_survey
end

post '/surveys/new' do
  @survey = Survey.new(name: params[:name], user_id: session[:id])
  if @survey.save
    @confirmation = "You made the survey '#{@survey.name}'!"
    erb :_new_question, layout: false
  else
    @errors = @survey.errors.full_messages
    erb :new_survey
  end
end

post '/questions/new/:survey_id' do
  @question = Question.create(text: params[:text], survey_id: params[:survey_id])
  erb :_new_choice, layout: false
end

post '/choices/new/:question_id' do
  @question = Question.find_by_id(params[:question_id])
  Choice.create(text: params[:text], question_id: params[:question_id])
  erb :_new_choice, layout: false
end 

get '/surveys/:id' do
  @survey = Survey.find_by_id(params[:id])
  @question = Question.where("survey_id = ?", @survey.id)
  erb :survey_page
end

post '/surveys/:survey_id/responses' do
  params[:question].each do |key, value|
    Response.create!(choice_id: value, survey_id: params[:survey_id], user_id: session[:id], question_id: key)
  end
  redirect "/surveys"
end

get '/surveys/:survey_id/stats' do
  survey = Survey.find_by_id(params[:survey_id])
  @responses = survey.responses
  erb :stats
end


delete '/surveys/:survey_id' do
  Survey.find(params[:survey_id]).destroy  
  redirect '/surveys'
end
