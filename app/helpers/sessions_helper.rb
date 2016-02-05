module SessionsHelper

  # Logs in given person.
  def log_in(person)
    session[:person_id] = person.id
  end

  def current_person?(person)
    person == current_person
  end

  # Returns the current logged-in person (if any).
  def current_person
    @current_person ||= Person.find_by(id: session[:person_id])
  end

  # Returns true if user is logged in, false otherwise.
  def logged_in?
    !current_person.nil?
  end

  # Logs out the current person.
  def log_out
    session.delete(:person_id)
    @current_person = nil
  end

  # Redirects to stored location (or to the default).
  def redirect_back_or(default)
    redirect_to(session[:forwarding_url] || default)
    session.delete(:forwarding_url)
  end

  # Stores the URL trying to be accessed.
  def store_location
    session[:forwarding_url] = request.url if request.get?
  end
end
