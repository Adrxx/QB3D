class CreateAnnouncements < ActiveRecord::Migration
  def change
    create_table :announcements do |t|
      t.string :title
      t.text :description
      t.string :link_name
      t.text :link_url
      t.boolean :featured
      t.attachment :photo_file


      t.timestamps null: false
    end
  end
end
