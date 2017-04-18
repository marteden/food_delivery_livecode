require_relative '../views/sessions_view'

class SessionsController
  def initialize(employee_repo)
    @repo = employee_repo
    @view = SessionsView.new
  end
end
