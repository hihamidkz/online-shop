class Book < ApplicationRecord
  mount_uploader :image, ImageUploader
  serialize :image, JSON
  belongs_to :user, optional: true

  validates :title, :author, :price, presence: true
  validates :description, length: { maximum: 1000, too_long: "Максимум %{count} символов" }
  validates :title, length: { maximum: 140, too_long: "Максимум %{count} символов" }
  validates :price, numericality: { only_integer: true }, length: { maximum: 7 }
  validates :year, numericality: { only_integer: true }, length: { maximum: 4, minimum: 4 }
end
