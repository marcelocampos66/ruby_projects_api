class CreateProjects < ActiveRecord::Migration[6.1]
  def change
    create_table :projects do |t|
      t.string :name, null:false
      t.string :language, null:false
      t.string :framework, null:false
      t.string :description, null:false
      t.string :image, null:false

      t.timestamps
    end
  end
end
