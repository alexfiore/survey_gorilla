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
<<<<<<< HEAD
  @user = User.find_by_email(params[:user][:email])

  if User.authenticate(params[:user][:email], params[:user][:password])
    session[:id] = @user.id
=======
  @user = User.find_by_email(params[:email])
  # figure this out
  if true
  # if User.authenticate(params[:name][:email], params[:name][:password])
  #   session[:id] = @user.id
>>>>>>> 181b557bdd4e77775eadd3da44d40933f8b7391a
    redirect "/surveys"
  else 
    erb :index
    #do error handling
  end
end

<<<<<<< HEAD
post '/sign_up' do
  puts params
  puts params[:user]
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
  "show some surveys!"
  # erb :surveys  
=======
post '/signup' do

  redirect "/surveys"
end


get '/surveys' do
  "show all surveys and give options to create survey, logout, stats"  
  puts Survey.all.first
  @surveys = Survey.all 
  erb :surveys
end

get '/surveys/new' do
  erb :new_survey
>>>>>>> 181b557bdd4e77775eadd3da44d40933f8b7391a
end

post '/surveys' do
  "create new survey and takes us to surveys erb"
end

get '/surveys/:id' do
  "shows the survey for the user to take"
  @survey = Survey.find_by_id(params[:id])
  puts "**************************"
  puts @survey
  @question = Question.where(survey_id: params[:id])
  puts "**************************"
  # puts @question
  # @choice =[]
  
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
