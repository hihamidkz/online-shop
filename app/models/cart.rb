class Cart < ApplicationRecord
    has_many :line_items, dependent: :destroy

    def add_book(book)
        current_item = line_items.find_by(book_id: book.id)
        
        if current_item
            current_item.increment(:quantity)
        else
            current_item = line_items.build(book_id: book.id)
        end
        current_item
    end
end
