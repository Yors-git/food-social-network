class RemoveAuthoridFromOpinions < ActiveRecord::Migration[6.0]
  def change
    remove_column :opinions, :authorid, :integer
  end
end
