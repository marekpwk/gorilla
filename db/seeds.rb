user = User.create(name: "Fred Flintstone", email: "fred@gmail.com", password: "Password1")

survey = Survey.create(name: "State Capitols", user_id: user.id)

question = Question.create(title: "What is the capitol of Illinois?", survey_id: survey.id)

choice1 = Choice.create(question_id: question.id, option: "Chicago" )
choice2 = Choice.create(question_id: question.id, option: "Springfield" )

question = Question.create(title: "What is the capitol of Ohio?", survey_id: survey.id)

choice1 = Choice.create(question_id: question.id, option: "Dayton" )
choice2 = Choice.create(question_id: question.id, option: "Columbus" )
choice3 = Choice.create(question_id: question.id, option: "Cleveland" )
