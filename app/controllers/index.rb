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


