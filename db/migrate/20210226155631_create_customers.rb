class CreateCustomers < ActiveRecord::Migration[6.0]
  def self.up
    create_table(:customers, :id => false) do |t|
      t.integer :customer_id, primary_key: true, :limit => 5, :null => :no
      t.string :first_name, :limit => 25
      t.string :last_name,  :limit => 25
      t.string :email,      :limit => 25
      t.string :phone,      :limit => 15

      t.timestamps :null => true
    end
  end

  def self.down
  end
end
