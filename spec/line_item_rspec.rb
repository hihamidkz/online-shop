require 'rails_helper'
require 'line_item'

describe LineItem do
  fixtures :all
  let (:line_item) { LineItem.create }

  it do
    expect(line_item).to belong_to(:book)
    expect(line_item).to belong_to(:cart)
  end

  it do
    line_item.book = books(:first)
    line_item.quantity = 3
    total_price = line_item.total_price
    expect(total_price).to eql(30)
  end
end
