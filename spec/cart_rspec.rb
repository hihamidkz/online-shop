require 'rails_helper'
require 'cart'

describe Cart do
  fixtures :all
  let (:cart) { Cart.create }
  let (:book1) { books(:first) }
  let (:book2) { books(:second) }

  it do
    item = cart.add_book(book1)
    expect(item.book).to eq(book1)
    expect(item.quantity).to eq(1)
  end

  it do
    cart.add_book(book1)
    cart.add_book(book2)
    total_price = cart.total_price
    expect(total_price).to eq(15)
  end
end
