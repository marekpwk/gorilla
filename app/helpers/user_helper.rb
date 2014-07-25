helpers do
  def current_user   #MAKE SURE TO SET session[:current] = CURRENT USER ID!!! DONE IN CONTROL BEFORE THEY GET TO SURVEY_LIST
  @current_user ||= User.find_by_id(session[:current])
  end
end
