get '/' do
  "show homepage with login and signin"
 
  erb :index
end

post '/signup' do
  redirect '/surveys'
end

post '/login' do
# create new user w/ login info
  redirect '/surveys'
end

get '/surveys' do
  "show all surveys and give options to create survey, logout, stats"  
end





