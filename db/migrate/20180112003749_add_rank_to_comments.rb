class AddRankToComments < ActiveRecord::Migration[5.1]
  def change
    add_column :comments, :rank, :float
  end
end
