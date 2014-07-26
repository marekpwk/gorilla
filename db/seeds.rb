user = User.create(name: "Fred Flintstone", email: "Flintstone@gmail.com", password: "Password1")

survey = Survey.create(name: "State Capitols", user_id: user.id)

question = Question.create(title: "What is the capitol of Illinois?", survey_id: survey.id)

choice1 = Choice.create(question_id: question.id, option: "Chicago" )
choice2 = Choice.create(question_id: question.id, option: "Springfield" )

question2 = Question.create(survey_id: 1, title: "How are you?",survey_id: survey.id)

choice1 = Choice.create(question_id: question2.id, option: "Great" )
choice2 = Choice.create(question_id: question2.id, option: "Not good" )

