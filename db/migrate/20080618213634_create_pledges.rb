class CreatePledges < ActiveRecord::Migration
  def self.up
    create_table :pledges do |t|
      t.integer :parent_id, :default => 0
      t.integer :amount_in_cents
      t.datetime :collected_at
      t.text :description
      t.string :email, :name
      t.timestamps
    end
  end

  def self.down
    drop_table :pledges
  end
end
