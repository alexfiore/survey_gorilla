before do
  
  pass if %w[surveys sign_in login sign_up logout].include? request.path_info.split('/')[1]

  unless current_user
    redirect to '/sign_in'
  end

end

get '/' do
  if current_user
    redirect "/surveys"
  else
    erb :index
  end
end

get '/sign_in' do
  erb :sign_in
end

get '/surveys' do
  if current_user 
    @surveys = Survey.all
    erb :surveys
  else
    redirect '/'
  end
end

not_found do 
  erb :not_found
end


