class CreateFigures < ActiveRecord::Migration
  
  def change 
    create table :titles do |t|
      t.string :name
    end
  end
end