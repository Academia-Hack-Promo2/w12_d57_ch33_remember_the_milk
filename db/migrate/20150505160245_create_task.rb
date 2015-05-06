class CreateTask < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
    	t.string :title, null: false
    	t.date :finish_date
    	t.string :status, limit: 10
    	t.string :task_type, limit: 15
    	t.timestamps null: false
      t.references :category, index: true, foreign_key:true
    end
  end
end
