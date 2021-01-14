class AddForeignKeyToOpinion < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :opinions, :users, column: :author_id
  end
end
