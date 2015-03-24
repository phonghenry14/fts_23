class User < ActiveRecord::Base
  has_many :examinations, dependent: :destroy
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def is_admin?
    role == 'admin'
  end
end
