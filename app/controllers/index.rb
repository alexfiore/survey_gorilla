before do 
  erb :index unless current_user 
end

get '/' do 
  @surveys = Survey.all                                                      
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

post '/signup' do
  @user = User.new(params[:user])

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
end

post '/surveys' do
  "create new survey and takes us to surveys erb"
  erb :surveys
end

get '/surveys/:survey_id' do
  "shows the survey for the user to take"
end

post '/surveys/:survey_id/responses' do
  "creates responses in database and goes back to surveys page"
  erb :surveys
end

get '/surveys/:survey_id/stats' do
  "shows the stats for a particular survey"
  erb :stats
end
