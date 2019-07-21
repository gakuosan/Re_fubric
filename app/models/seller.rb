class Seller < ApplicationRecord
  has_secure_password varidations:false
  attr_accessor :remember_token
  has_many :fabrics, dependent: :destroy
  has_many :stocks, dependent: :destroy

  before_save { self.email = email.downcase }
end


  # ランダムなトークンを返す
  def Seller.new_token
    # Userクラスにnew_tokenを渡したクラスメソッドを作成
    SecureRandom.urlsafe_base64
    # SecureRandomモジュールにbase64でランダムな文字列を生成
  end

  # 記憶トークンをユーザーオブジェクトに代入し、DBのデータを更新する。
  def remember
    self.remember_token =
    update_attribute(:remember_digest, )
  end


def Seller.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  # ランダムなトークンを返す
  def Seller.new_token
   # Userクラスにnew_tokenを渡したクラスメソッドを作成
    SecureRandom.urlsafe_base64
   # SecureRandomモジュールにbase64でランダムな文字列を生成
  end

  def authenticate(submitted_password)
  self.has_password?(submitted_password)
end

def image
  profile_image.attached? ? profile_image : ''
end



private

def downcase_email
  self.email = self.email.downcase
end

def create_activation_digest
  self.activation_token  = Seller.new_token
  self.activation_digest = Seller.digest(self.activation_token)
  @seller.activation_digest
end
