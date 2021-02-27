require 'test_helper'
# require 'pry'

class CustomerTest < ActiveSupport::TestCase
  def setup
    @customer = Customer.new(
                              customer_id: 1, first_name: "John", 
                              last_name: "Doe", email: 'john@gmail.com', phone: 12345)
  end

  test "Customer should be valid" do
    assert @customer.valid?
  end

  test "First name should be present" do
    @customer.first_name = ""
    assert_not @customer.valid?
  end

  test "email should be uniq with customer id" do
    @customer.save
    assert_no_difference('Customer.count') do
      @customer_copy = Customer.new(
                                    customer_id: 1, first_name: "John", 
                                    last_name: "Doe", email: 'john@gmail.com', phone: 123456)
      @customer_copy.save
    end
  end

  test "phone should be uniq with customer id" do
    @customer.save
    assert_no_difference('Customer.count') do
      @customer_copy = Customer.new(
                                    customer_id: 1, first_name: "John", 
                                    last_name: "Doe", email: 'johndow@gmail.com', phone: 12345)
      @customer_copy.save
    end
  end

end
