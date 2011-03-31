class CreateComments < ActiveRecord::Migration
  def self.up
    create_table :comments do |t|
      t.string :author_name
      t.text :body

      # add a foreign key
      t.integer :article_id
      t.timestamps
    end
  end

  def self.down
    drop_table :comments
  end
end
