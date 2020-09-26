class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.string :email_address
      t.text :content
      t.datetime :delivery_time
    end
  end
end
