class CreateIgnoreGroups < ActiveRecord::Migration
  def change
    create_table :ignore_groups do |t|
      t.string :title
      t.text :words

      t.timestamps
    end
  end
end
