class Book < ApplicationRecord
  before_destroy :not_referenced_by_any_line_item
  mount_uploader :image, ImageUploader
  serialize :image, JSON
  belongs_to :user, optional: true
  has_many :line_items
  validates :title, :author, :price, presence: true
  validates :description, length: { maximum: 1000, too_long: "Максимум %{count} символов" }
  validates :title, length: { maximum: 140, too_long: "Максимум %{count} символов" }
  validates :price, length: { maximum: 7 }
  validates :year, numericality: { only_integer: true }, length: { maximum: 4, minimum: 4 }

  private

  def not_referenced_by_any_line_item
    unless line_items.empty?
      errors.add(:base, "Line items present")
      throw :abort
    end
  end
end
