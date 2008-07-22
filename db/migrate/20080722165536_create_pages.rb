class CreatePages < ActiveRecord::Migration
  def self.up
    create_table :pages do |t|
      t.belongs_to :site
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :pages
  end
end
