get '/survey/:id/take' do
  # get the info for the selected survey
  @survey = Survey.find(params[:id])

  # create a new completed survey
  @completed_survey = Completed_survey.create(user_id: session[:current], survey_id: params[:id])

  # create new blank responses
  @survey.questions.each do |question|
    Response.create(completed_survey: @completed_survey.id, question_id: question.id)
  end

  # get the first question and choices from the blank responses
  @question = @completed_survey.responses.first.question

  erb :new_survey

end