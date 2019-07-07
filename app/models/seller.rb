class Seller < ApplicationRecord
  attr_accessor :name, :email
  attr_accessor :remember_token

  # ランダムなトークンを返す
  def Seller.new_token                                                            # Userクラスにnew_tokenを渡したクラスメソッドを作成
    SecureRandom.urlsafe_base64                                                 # SecureRandomモジュールにbase64でランダムな文字列を生成
  end

  # 記憶トークンをユーザーオブジェクトに代入し、DBのデータを更新する。
  def remember
    self.remember_token =                                                       #
    update_attribute(:remember_digest, )                                        #
  end
end


def Seller.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  # ランダムなトークンを返す
  def Seller.new_token                                                            # Userクラスにnew_tokenを渡したクラスメソッドを作成
    SecureRandom.urlsafe_base64                                                 # SecureRandomモジュールにbase64でランダムな文字列を生成
  end

  # 記憶トークンをUserオブジェクトのremember_token属性に代入し、DBに記憶ダイジェストとして保存
  def remember
    self.remember_token = Seller.new_token                                        # 記憶トークンをremember_token属性に代入
    update_attribute(:remember_digest, Seller.digest(remember_token))             # DBのremember_token属性値をBcryptに渡してハッシュ化して更新
  end
