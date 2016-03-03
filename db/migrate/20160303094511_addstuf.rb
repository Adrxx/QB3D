class Addstuf < ActiveRecord::Migration
  def self.up
    change_table :announcements do |t|
      t.attachment :photo_file
      t.text :link_url
      t.string :link_name
    end
  end

  def self.down
    remove_attachment :announcements, :photo_file
  end
end
