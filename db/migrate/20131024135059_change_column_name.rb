class ChangeColumnName < ActiveRecord::Migration
  def change
    rename_column :publications, :name, :title
  end
end
