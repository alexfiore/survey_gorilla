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


get '/surveys' do
  "show all surveys and give options to create survey, logout, stats"
  @surveys = Survey.all
  erb :surveys
end

