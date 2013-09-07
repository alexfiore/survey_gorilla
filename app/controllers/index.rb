before do
  erb :index unless current_user
end

get '/' do
  if current_user
    redirect "/surveys"
  else
    erb :index
  end
end


post '/login' do
  @user = User.find_by_email(params[:user][:email])
  if User.authenticate(params[:user][:email], params[:user][:password])
    session[:id] = @user.id
    redirect "/surveys"
  else
    erb :index
    #do error handling
  end
end

post '/sign_up' do
  @user = User.new(params[:user])
  @user.save
  if @user.save
    session[:id] = @user.id
    redirect "/surveys"
  else
    erb :index
  end
end

get '/logout' do
  session.clear
  redirect '/'
end

get '/surveys' do
  "show all surveys and give options to create survey, logout, stats"
  @surveys = Survey.all
  erb :surveys
end

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
