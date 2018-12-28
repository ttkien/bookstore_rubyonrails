class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :title
      t.string :description
      t.date :published_date
      t.string :cover_url

      t.timestamps
    end
  end
end
