class Buyer < ApplicationRecord
  attr_accessor :name, :email
  attr_accessor :remember_token
  has_many :likes, dependent: :destroy


  # ランダムなトークンを返す
  def Buyer.new_token
    # Userクラスにnew_tokenを渡したクラスメソッドを作成
    SecureRandom.urlsafe_base64
    # SecureRandomモジュールにbase64でランダムな文字列を生成
  end

  # 記憶トークンをユーザーオブジェクトに代入し、DBのデータを更新する。
  def remember
    self.remember_token =                                                       #
    update_attribute(:remember_digest, )                                        #
  end
end


def Buyer.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  # ランダムなトークンを返す
  def Buyer.new_token
    # Userクラスにnew_tokenを渡したクラスメソッドを作成
    SecureRandom.urlsafe_base64
    # SecureRandomモジュールにbase64でランダムな文字列を生成
  end

  # 記憶トークンをUserオブジェクトのremember_token属性に代入し、DBに記憶ダイジェストとして保存
  def remember
    self.remember_token = Buyer.new_token
    # 記憶トークンをremember_token属性に代入
    update_attribute(:remember_digest, Buyer.digest(remember_token))
    # DBのremember_token属性値をBcryptに渡してハッシュ化して更新
  end

  # 渡されたトークンがダイジェストと一致したらtrueを返す
  def authenticated?(attribute, token)
    digest = self.send("#{attribute}_digest")
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(token)
  end

  def activate
    update_attribute(:activated,    true)
    update_attribute(:activated_at, Time.zone.now)
  end

  def send_activation_email
    BuyerMailer.account_activation(self).deliver_now
  end

  def create_reset_digest
    self.reset_token = User.new_token
    update_attribute(:reset_digest,  Buyer.digest(reset_token))
    update_attribute(:reset_sent_at, Time.zone.now)
  end

  def send_password_reset_email
    BuyerMailer.password_reset(self).deliver_now
  end

  def password_reset_expired?
    reset_sent_at < 1.hours.ago
  end

  def image
    profile_image.attached? ? profile_image : '/images/fallback/photo.png'
  end

  private

  def downcase_email
    self.email = self.email.downcase
  end

  def create_activation_digest
    self.activation_token  = Buyer.new_token
    self.activation_digest = Buyer.digest(self.activation_token)
    # @user.activation_digest => ハッシュ値
  end
