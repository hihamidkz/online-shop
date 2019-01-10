class Book < ApplicationRecord
  mount_uploader :image, ImageUploader
  serialize :image, JSON
  belongs_to :user, optional: true

  validates :title, :author, :price, :year, presence: true
  validates :description, length: { maximum: 1000, too_long: "Максимум %{count} символов" }
  validates :title, length: { maximum: 30, too_long: "Максимум %{count} символов" }
  validates :price, length: { maximum: 7 }
  validates :year, length: { maximum: 4, minimum: 4 }
end
