module SessionsHelper

  # Logs in given person.
  def log_in(person)
    session[:person_id] = person.id
  end

  # Returns the current logged-in person (if any).
  def current_person
    @current_person ||= Person.find_by(id: session[:person_id])
  end

  # Returns true if user is logged in, false otherwise.
  def logged_in?
    !current_person.nil?
  end
end
