
# survey creation
get '/surveys/new' do
  erb :new_survey
end

post '/surveys' do
  "create new survey and takes us to surveys erb"
  puts params
  # =>{"name"=>"test", "question"=>"question test", "choice1"=>"first", "choice2"=>"second", "choice3"=>"third"}
  survey = Survey.create!(:name => params[:name])
  question = Question.create!(:text => params[:question], :survey_id => survey.id)

  40.times {print "*"}
  p params
  puts params[:choices]
  params[:choices].each do |choice|
    Choice.create(text: params[:choice1])
  end

  # Choice.create!(:text => params[:choice1],:question_id => question.id)
  # Choice.create!(:text => params[:choice2], :question_id => question.id)
  # Choice.create!(:text => params[:choice3], :question_id => question.id)


  redirect "/surveys/#{survey.id}"
end

get '/surveys/:id' do
  "shows the survey for the user to take"
  @survey = Survey.find_by_id(params[:id])
  @question = Question.where("survey_id = ?", @survey.id)
  erb :survey_page
end

post '/surveys/:survey_id/responses' do
  "creates responses in database and goes back to surveys page"
  erb :surveys
end

get '/surveys/:survey_id/stats' do
  "shows the stats for a particular survey"
  erb :stats
end

delete '/surveys/:survey_id' do
  Survey.find(params[:survey_id]).destroy  
  redirect '/surveys'
end
