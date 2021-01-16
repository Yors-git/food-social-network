class CreateFollowships < ActiveRecord::Migration[6.0]
  def change
    create_table :followships do |t|
      t.references :user, index: true, foreign_key: true
      t.references :follower, index: true
      t.boolean :blocked

      t.timestamps null: false
    end
    add_foreign_key :followships, :users, column: :follower_id
  end
end
