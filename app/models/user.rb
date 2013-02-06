class User < ActiveRecord::Base
  rolify

  ADMIN = "admin"
  BAND_MEMBER = "band_member"
  VENUE_MANAGER = "venue_manager"

  ALL_ROLES = [ADMIN, BAND_MEMBER, VENUE_MANAGER]
  PUBLIC_ROLES = [BAND_MEMBER, VENUE_MANAGER]

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  has_many :band_participations
  has_many :bands, through: :band_participations

  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name, :role
  attr_accessor :role
  attr_accessor :force_create

  validates_presence_of :first_name, :last_name
  validates_presence_of :role, on: :create
  validates_inclusion_of :role, in: PUBLIC_ROLES, on: :create, unless: "self.force_create"

  after_create :grant_role


  def name
    "#{self.first_name.capitalize} #{self.last_name.upcase}"
  end

  def self.available_roles
    ALL_ROLES
  end

  def self.available_roles_for_public
    PUBLIC_ROLES
  end

  def roles_list
    self.roles.collect { |r| r.name }
  end

  def active_for_authentication?
    # Comment out the below debug statement to view the properties of the returned self model values.
    # logger.debug self.to_yaml
      
    super && account_active?
  end

  def account_active?
    roles_list.any?
  end

  def grant_role
    return if role.nil?
    self.grant role.to_sym
  end
end
