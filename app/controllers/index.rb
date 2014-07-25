get '/'  do
    erb :index
end

post '/' do
  #user authentication
  @curr_user = User.authenticate(params[:input])
  if @curr_user == nil
    flash[:error] = "Invalid email/password. Please try again!"
  else
    session[:curr] = @curr_user.id
    redirect to("/survey_list")
  end
end

post '/logout' do
  session[:curr] = nil
  redirect to('/')
end

get '/register' do
  erb :register
end

post '/register' do
  @curr_user = User.create(params[:input])
  session[:curr] = @curr_user.id
  redirect to("/survey_list")
end


get '/survey_list' do
  @surveys = Survey.all

  erb :all_survey_list
end

