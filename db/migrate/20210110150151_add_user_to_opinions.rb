class AddUserToOpinions < ActiveRecord::Migration[6.0]
  def change
    add_reference :opinions, :author
  end
end
