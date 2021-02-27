class Customer < ApplicationRecord
  validates :first_name, presence: true
  validates :email, uniqueness: { scope: :customer_id, message: "should be unique per customer" }
  validates :phone, uniqueness: { scope: :customer_id, message: "should be unique per customer" }

  class << self

    def import_data(csv_text)
      require 'csv'
      csv = CSV.parse(csv_text, :headers => true)
      if csv.headers.all? { |each| ["Customer_Id", "First_Name", "Last_Name", "Email_Address", "Phone"].include?(each) }
        invalid_customers_count = 0
        csv.each do |row|
          row = row.to_hash
          customer = Customer.new(
                                  customer_id: row['Customer_Id'], first_name: row['First_Name'], 
                                  last_name: row['Last_Name'], email: row['Email_Address'], phone: row['Phone'])
          if !customer.save
            invalid_customers_count += 1
          end
        end
        ActionCable.server.broadcast "customer_room_channel", {
                                                            response: '200', 
                                                            invalid_customers_count: invalid_customers_count,
                                                            customers: Customer.all.to_json
                                                          }
      else
        ActionCable.server.broadcast "customer_room_channel", {response: '500', error: 'Invalid Headers found'}
      end
    end

  end
end
