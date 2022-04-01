require "test_helper"

class OrderMailerTest < ActionMailer::TestCase
  test "received" do
    mail = OrderMailer.received(orders(:one))
    assert_equal "Order Confirmation", mail.subject
    assert_equal ["dave@example.org"], mail.to
    assert_equal ["zil@norvilis.com"], mail.from
    debugger
    assert_match /1 x MyString/, mail.body.encoded
  end

  test "shipped" do
    mail = OrderMailer.shipped(orders(:one))
    assert_equal "Order Shipped", mail.subject
    assert_equal ["dave@example.org"], mail.to
    assert_equal ["zil@norvilis.com"], mail.from
     assert_match /<td[^>]*>1<\/td>\s*<td>Programming Ruby 1.9<\/td>/,
      mail.body.encoded

  end

end
