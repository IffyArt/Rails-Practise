class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable
  has_many :shopping_carts
  has_many :orders

  validates :name, :presence => true
  validates :nickname, :presence => true
  validates :phone, :presence => true
  validates :phone_memo, :presence => true

  def is_admin?
    is_admin
  end
end
