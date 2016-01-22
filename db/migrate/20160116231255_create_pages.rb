class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.integer "subject_id"
      #same as t.references :subject   AND MAYBE t.belongs_to :subject  ???
      t.string :name
      t.integer :permalink
      t.integer :position
      t.boolean :visible
      t.timestamps null: false
    end  
      add_index("pages", "subject_id")
      add_index("pages", "permalink")
  end
end
