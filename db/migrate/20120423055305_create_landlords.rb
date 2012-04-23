class CreateLandlords < ActiveRecord::Migration
  def self.up
    create_table :landlords do |t|
      t.string    :name
      t.string    :email
      t.string    :website
      t.string    :phone
      t.string    :address
      t.string    :city
      t.string    :state
      t.integer   :zip
    end
  end

  def self.down
    drop_table :landlords
  end
end
