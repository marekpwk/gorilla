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

get '/create_survey' do
  erb :create_survey
end

post '/survey' do
  @survey_new = Survey.new(name: params[:name], user_id: current_user.id)
  @survey_new.save
  redirect to ("/survey/#{@survey_new.id}")
end

get '/survey/:id' do
  @survey = Survey.find(params[:id])
  erb :survey
end

post '/survey/:id/questions' do
  Question.create(survey_id: params[:id], title: params[:question])
  question = Question.last
  answer_obj = params[:answer]
  answer_obj.each do |key, value|
    Choice.create(question: question, option: value["value"])
  end
  content_type = "json"
  {message: "Yeah, I did it mofo"}.to_json
end



# get '/surveytake/:id' do
#   # binding.pry
#   session[:current] = 1   # be sure to get rid of this line
#   # get the info for the selected survey
#   @survey = Survey.find(params[:id])

#   # create a new completed survey
#   @completed_survey = CompletedSurvey.create(user_id: session[:current], survey_id: params[:id])

#   # create new blank responses
#   @survey.questions.each do |question|
#     Response.create(completed_survey_id: @completed_survey.id, question_id: question.id)
#   end

#   # # get the first question and choices from the blank responses
#   @survey_response = @completed_survey.responses.first
#   @question = @survey_response.first.question

#   erb :take_survey, :layout => :survey_layout

# end

# post '/surveytake/:id' do
#   completed_survey_id = params[:completed_survey_id]
#   question_id = params[:question_id]


# end
