class CombineItemsInCart < ActiveRecord::Migration[5.1]
  def up
    Cart.all.each do |cart|
      sums = cart.line_items.group(:book_id).sum(:quantity)
      sums.each do |book_id, quantity|
        if quantity > 1
          cart.line_items.where(book_id: book_id).delete_all

          item = cart.line_items.build(book_id: book_id)
          item.quantity = quantity
          item.save!
        end
      end
    end
  end
end
