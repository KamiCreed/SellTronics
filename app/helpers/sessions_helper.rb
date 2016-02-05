module SessionsHelper

  # Logs in given person.
  def log_in(person)
    session[:person_id] = person.id
  end
end
