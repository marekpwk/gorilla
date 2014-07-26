get '/survey/:id/take' do
  session[:current] = 1   # be sure to get rid of this line
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

  erb :take_survey, :layout => :survey_layout

end

post '/survey/:id/take' do
  # binding.pry
  survey_response_id = params[:survey_response_id]
  choice_id = params[:choice_id]
  completed_survey_id = params[:completed_survey_id]
  respon = Response.find_by_id(survey_response_id)
  respon.update_attributes({choice_id: choice_id, completed_survey_id: completed_survey_id })
  # binding.pry
  option = respon.choice.option
  title = respon.question.title
  content_type = "json"
  {:option => option, :title => title}.to_json





  # save the change to the response

  # get another response

  # if none. need to tell browser that they are finished somehow

end

