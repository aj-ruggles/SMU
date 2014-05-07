class DashboardController < ApplicationController
  def index
    @groups = Group.where(id: current_user.group_id)
  end
end
