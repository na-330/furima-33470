class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # 入力必須のみ
  validates :nickname, presence: true
  validates :birth_date, presence: true

  # メアド
  # EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  # validates :email, {presence: true, with:EMAIL_REGEX, uniqueness: true}
  validates :email, format: { presence: true, with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i, uniqueness: true }

  # パスを英数字含める
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates_format_of :password, { presence: true, with: PASSWORD_REGEX }

  # 名前の入力、jは日本語・kはカタカナ
  with_options format: { presence: true, with: /\A[ぁ-んァ-ヶ一-龥々]+\z/ } do
    validates :last_name_j
    validates :first_name_j
  end

  with_options format: { presence: true, with: /\A[ァ-ヶー－]+\z/ } do
    validates :last_name_k
    validates :first_name_k
  end
end
