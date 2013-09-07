
# survey creation
get '/surveys/new' do
  erb :new_survey
end

post '/surveys' do
  "create new survey and takes us to surveys erb"
  survey = Survey.create!(:name => params[:name])
  question = Question.create!(:text => params[:question], :survey_id => survey.id)
  Choice.create!(:text => params[:choice1],:question_id => question.id)
  Choice.create!(:text => params[:choice2], :question_id => question.id)
  Choice.create!(:text => params[:choice3], :question_id => question.id)
  redirect "/surveys/#{survey.id}"
end

get '/surveys/:id' do
  "shows the survey for the user to take"
  @survey = Survey.find_by_id(params[:id])
  @question = Question.where("survey_id = ?", @survey.id)
 [qo1]
  @choice1 = Choice.where("question_id = ?", @question.first.id)  
  [co1,co2,co3]
  #this only grabs the choices for the first question (in an array)
  

  # @choice = Choice.where(question_id: @question.id)
  # puts "**************************"
  # puts @choice
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
