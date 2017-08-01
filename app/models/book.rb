class Book < ApplicationRecord
  has_many :line_items
  before_destroy :ensure_not_referenced_by_any_line_item
  mount_uploader :image, ImageUploader

  def self.search(search)
    where("title LIKE ? OR author LIKE ?", "%#{search}%", "%#{search}%")
  end

  private
  def ensure_not_referenced_by_any_line_item
    unless line_items.empty?
      errors.add(:base, 'Line Items present')
      throw :abort
    end
  end
end
