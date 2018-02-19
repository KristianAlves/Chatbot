class CreateLinks < ActiveRecord::Migration[5.1]
  def change
    create_table :links do |t|
      t.text :description
      t.string :link
      t.integer :company_id
    end
  end
end