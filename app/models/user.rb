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
  validates :email, format: {presence: true, with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i, uniqueness: true }


  # パスを英数字含める
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, {presence: true, with: PASSWORD_REGEX}

  # 名前の入力、jは日本語・kはカタカナ
  # NAME_J_REGEX = /\A[ぁ-んァ-ン一-龥]/
  # NAME_K_REGEX = /\A[\p{katakana}\u{30fc}]+\z/
  validates_format_of :last_name_j,{presence: true, with: /\A[ぁ-んァ-ヶ一-龥々]+\z/}
  validates_format_of :first_name_j,{presence: true, with: /\A[ぁ-んァ-ヶ一-龥々]+\z/}
  validates_format_of :last_name_k,{presence: true, with:/\A[ァ-ヶー－]+\z/}
  validates_format_of :first_name_k,{presence: true, with:/\A[ァ-ヶー－]+\z/}

end
