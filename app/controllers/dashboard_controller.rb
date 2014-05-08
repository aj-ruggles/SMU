class DashboardController < ApplicationController
  def index
    @groups = Group.where(organization_id: current_user.organization_id)
  end
end
