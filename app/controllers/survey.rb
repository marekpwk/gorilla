before '/survey/:id/take' do
  if session[:current] == nil
    redirect to('/')
  end
end

before '/survey_results/:id' do
  if session[:current] == nil
    redirect to('/')
  end
end

get '/survey/:id/take' do
  # session[:current] = 1   # be sure to get rid of this line
  # get the info for the selected survey
  @survey = Survey.find(params[:id])
  # binding.pry
  # create a new completed survey
  @completed_survey = CompletedSurvey.create(user_id: session[:current], survey_id: params[:id])

  # create new blank responses
  @survey.questions.each do |question|
    Response.create(completed_survey_id: @completed_survey.id, question_id: question.id)
  end

  # get the first question and choices from the blank responses
  @survey_response = @completed_survey.responses.first
  @question = @survey_response.question
  # @question = @survey.questions.first

  erb :take_survey, :layout => :survey_layout

end

post '/survey/:id/take' do 
  # binding.pry
  survey_response_id = params[:survey_response_id]
  choice_id = params[:choice_id]
  completed_survey_id = params[:completed_survey_id]

  respon = Response.find_by_id(survey_response_id)
  respon.update_attributes({choice_id: choice_id })

  respon_new = Response.where( completed_survey_id: completed_survey_id, choice: nil).take
  if respon_new != nil 
    question_next = respon_new.question
    title = question_next.title
    question_next_id = question_next.id

    content_type = "json"
    # binding.pry
    # send back the next question and choices
    {:title => title, :question_next_id => question_next_id, :survey_response_id => respon_new.id, :choices => question_next.choices}.to_json
  else
    # we have run out of questions so send back a nil so that we can thank the survey taker
    {:title => nil, :question_next_id => nil}.to_json
  end

end

get '/survey_results/:id' do
  # get the survey results and call the view
  @survey = Survey.find_by_id(params[:id])

  erb :survey_results
end

