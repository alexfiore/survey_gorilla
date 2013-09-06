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


