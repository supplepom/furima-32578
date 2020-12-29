class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :items


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
  validates :nickname
  validates :date_of_birth
  end

  with_options presence: true, format: { with: /\A[a-zA-Z0-9]+\z/, message: 'is invalid. Input half-width characters.' } do
    validates :password
  end


  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々]/, message: 'is invalid. Input full-width characters.' } do
    validates :family_name
    validates :first_name
  end

  with_options presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: 'is invalid. Input full-width katakana characters.' } do
    validates :family_name_kana              
    validates :first_name_kana
  end
end
