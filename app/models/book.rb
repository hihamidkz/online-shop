class Book < ApplicationRecord
  before_destroy :not_referenced_by_any_line_item
  mount_uploader :image, ImageUploader
  serialize :image, JSON
  belongs_to :user, optional: true
  has_many :line_items
  validates :title, :author, :price, :year, presence: true
  validates :description, length: { maximum: 1000, too_long: "Максимум %{count} символов" }
  validates :title, length: { maximum: 30, too_long: "Максимум %{count} символов" }
  validates :price, length: { maximum: 7 }
  validates :year, length: { maximum: 4, minimum: 4 }

  private

  def not_referenced_by_any_line_item
    unless line_items.empty?
      errors.add(:base, "Line items present")
      throw :abort
    end
  end
end
