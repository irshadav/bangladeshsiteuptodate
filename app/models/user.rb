class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  enum role: [:user, :editer, :admin]
  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
    self.role ||= :user
  end

  validates :first_name, :last_name, :degree_level, presence: true

  def fullname
     first_name.capitalize  + " " + last_name.capitalize 
  end

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>", :small => "60x60>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

end
