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
