class CreateReviews < ActiveRecord::Migration
  def self.up
    create_table :reviews do |t|
      t.string :review_body
      t.float :rating
      t.integer :helpfullness
      t.integer :flag

      t.timestamps
    end
  end

  def self.down
    drop_table :reviews
  end
end
