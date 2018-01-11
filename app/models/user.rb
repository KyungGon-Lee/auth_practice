class User < ActiveRecord::Base
  rolify
  after_create :assign_default_role
  # before_create # 모델에서 비포액션같은거
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  def assign_default_role
   self.add_role(:yangmin) if self.roles.blank?
  end
  
  has_many :posts
end
