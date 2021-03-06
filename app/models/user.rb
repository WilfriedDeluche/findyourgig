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

  has_many :band_participations, dependent: :destroy
  has_many :bands, through: :band_participations
  has_many :managerships, dependent: :destroy
  has_many :venues, through: :managerships

  mount_uploader :avatar, AvatarUploader

  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name, :role,
                  :avatar, :avatar_cache, :remote_avatar_url
  attr_accessor :role
  attr_accessor :force_create

  validates_presence_of :first_name, :last_name
  validates_presence_of :role, on: :create
  validates_inclusion_of :role, in: PUBLIC_ROLES, on: :create, unless: "self.force_create"

  after_create :grant_role
  after_destroy :remove_upload_folder

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

  def is_venue_manager?
    self.roles_list.include?(VENUE_MANAGER)
  end

  def is_band_member?
    self.roles_list.include?(BAND_MEMBER)
  end

  def is_admin?
    self.roles_list.include?(ADMIN)
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

  def remove_upload_folder
    FileUtils.remove_dir("#{Rails.root}/public/uploads/users/#{self.id}", :force => true)
  end
end
