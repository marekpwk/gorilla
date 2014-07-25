get '/'  do
    erb :index
end

post '/' do
  data = params[:data]
  user = User.find_by_email(data[:email])
  auth = user.try(:authenticate, data[:password])

  if auth
    session[:current] = user.id
    redirect to('/survey_list')
  else
    redirect back
  end
  #user authentication

  # @curr_user = User.authenticate(params[:input])
  # if @curr_user == nil
  #   flash[:error] = "Invalid email/password. Please try again!"
  # else
  #   session[:curr] = @curr_user.id
  #   redirect to("/survey_list")
  # end
end

get '/logout' do
  session[:current] = nil
  redirect to('/')
end

get '/register' do
  erb :register
end

post '/register' do
  user = User.create(params[:input])
  if user.valid?
    session[:current] = user.id
    redirect to("/survey_list")
  else
    erb :register
  end
end


get '/survey_list' do
  @surveys = Survey.all
  erb :survey_list
end

