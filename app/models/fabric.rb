class Fabric < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :seller
  has_many :likes, dependent: :destroy
  has_many :stocks, dependent: :destroy
  default_scope -> { order(created_at: :desc) }
  # 並び順を降順に変更
  # image属性にImageUploader（画像投稿gem）を渡す。
  validates :seller_id, presence: true
end
