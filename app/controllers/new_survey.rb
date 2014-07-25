get '/survey/:id/take' do
  session[:current] = 1   # be sure to get rid of this line
  # get the info for the selected survey
  @survey = Survey.find(params[:id])

  # create a new completed survey
  @completed_survey = CompletedSurvey.create(user_id: session[:current], survey_id: params[:id])

  # create new blank responses
  @survey.questions.each do |question|
    Response.create(completed_survey_id: @completed_survey.id, question_id: question.id)
  end

  # get the first question and choices from the blank responses
  @response = @completed_survey.responses.first
  @question = @response.question

  erb :take_survey, :layout => :survey_layout

end

post '/survey/:id/take' do
  completed_survey_id = params[:completed_survey_id]
  question_id = params[:question_id]

end

