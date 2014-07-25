helpers do
  def current_user   #MAKE SURE TO SET session[:current] = CURRENT USER ID!!! DONE IN CONTROL BEFORE THEY GET TO ALL_SURVEY_LIST
    id = session[:current]
    if id
      begin
        @curr_user = User.find(id)
        return @curr_user
      rescue 
        session[:current] = nil
        return nil
      end
    else
      return nil
    end
  end
end