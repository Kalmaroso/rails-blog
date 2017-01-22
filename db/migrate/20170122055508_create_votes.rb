class CreateVotes < ActiveRecord::Migration[5.0]
  def change
    create_table :votes do |t|
      t.integer :value
      t.references :votable, polymorphic: true, index: true
      t.integer :user_id

      t.timestamps
    end
  end
end
