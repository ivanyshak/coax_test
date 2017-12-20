class User < ApplicationRecord
  mount_uploader :avatar, PictureUploader
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :bicycles, dependent: :destroy       
  
  GENDER_TYPES = ["Not telling","Male", "Female"]
  
  def full_name
  	"#{first_name}  #{last_name}"       	
  end       
end
