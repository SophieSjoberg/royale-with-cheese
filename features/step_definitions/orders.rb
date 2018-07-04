And('I click on {string} for {string}') do |button, title|
  product = Product.find_by(title: title)
  within "#product-#{product.id}" do
    click_link_or_button button
  end
end

Then('an order should have been created in the database') do
  @order = Order.last
  expect(@order).not_to be nil
end

Then('{string} should be an order item') do |product_name|
  @order ||= Order.last
  items_collection = @order.order_items.map { |product| product.item.title }
  expect(items_collection).to include product_name
end

# Given('there is an order with order item {string}') do |product|
#   steps %(
#     And I click on "Add to Order" for "#{product}"
#     Then an order should have been created in the database
#   )
# end

Then('I should have {string} products in my order') do |count|
  expect(@order.order_items.count).to eq count.to_i
end
