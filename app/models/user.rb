class User < ActiveRecord::Base
  rolify

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name

  validates_presence_of :first_name, :last_name


  def name
    "#{self.first_name.capitalize} #{self.last_name.upcase}"
  end

  def self.available_roles
    ["admin", "band_member", "venue_manager"]
  end

  def role_list
    self.roles.collect { |r| r.name }
  end
end
