class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  after_create :assign_default_role
  after_create :add_base_schedule
  belongs_to :organization
  has_many :schedules
  belongs_to :group
  ROLES = %w[sysadmin admin manager employee]

  def is?(role)
    roles.include?(role.to_s)
  end

  def assign_default_role
    if self.role.blank?
      self.role = :employee.to_s
    end
  end

  def add_base_schedule
    Schedule.create do |s|
      s.user_id = self.id
    end
  end

  def schedule
    schedules.last
  end

  def new_schedule
    schedule = Schedule.new do |s|
      s.user_id = self.id
      s.mon = schedules.last
      s.tues = schedules.last
      s.wed = schedules.last
      s.thur = schedules.last
      s.fri = schedules.last
      s.sat = schedules.last
      s.sun = schedules.last
      (schedules.last.to_param)
    end
  end
end
