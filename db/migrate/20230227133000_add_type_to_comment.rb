class AddTypeToComment < ActiveRecord::Migration[7.1]
  def change
    add_column :comments, :type, :string
  end
end
