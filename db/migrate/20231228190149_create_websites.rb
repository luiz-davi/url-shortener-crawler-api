class CreateWebsites < ActiveRecord::Migration[7.1]
  def change
    create_table :websites do |t|
      t.string :link
      t.string :name

      t.timestamps
    end
  end
end
