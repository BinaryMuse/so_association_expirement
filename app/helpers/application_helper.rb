module ApplicationHelper
  def current_user
    begin
      session[:current_user_id] ? User.find(session[:current_user_id]) : nil
    rescue ActiveRecord::RecordNotFound
      nil
    end
  end
end
