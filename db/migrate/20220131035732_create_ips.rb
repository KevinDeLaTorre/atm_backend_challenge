class CreateIps < ActiveRecord::Migration[7.0]
  def change
    create_table :ips do |t|
      t.string :ip
      t.string :country
      t.string :city

      t.timestamps
    end
    add_index :ips, :ip
  end
end
