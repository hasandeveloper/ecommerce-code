class ChangeColumnTypeOfNumberInUser < ActiveRecord::Migration[5.1]
  def change
    change_column :users, :mobile, :string
  end
end
