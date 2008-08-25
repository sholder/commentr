class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :username, :password_hash, :null => false
      t.boolean :is_admin, :null => false, :default => false
      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
