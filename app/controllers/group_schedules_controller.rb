class GroupSchedulesController < ApplicationController
  before_action :set_group_schedule, only: [:edit]
  def index
    if current_user.is?(:admin)
      @groups = Group.find(current_user.group)
    end
  end

  def new
    @group = Group.find(params[:id])
    @users = @group.users
    for user in @users
      @schedules = @schedules.to_a.push(user.schedule)
    end
  end

  def edit
  end

  def create
  end

  def update
    @schedules = params[:schedules]
    @schedules.each do |s|
      schedule = Schedule.find(s[0]).dup
      schedule.update(s[1])
      schedule.save
    end

    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Group Schedules saved.' }
      #format.json { render action: 'show', status: :created, location: @group }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group_schedule
      @group = Group.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def group_schedule_params
      params.require(:group_schedules).permit(:id, :organization_id, :name, :schedules)
    end
end
