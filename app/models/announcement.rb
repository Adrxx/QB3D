class Announcement < ActiveRecord::Base

  before_save :only_one_featured

  has_attached_file :photo_file,
  :styles => {
    :thumb => "400x400>" },
  :convert_options => {
    :thumb => "-quality 95 -strip" }
    validates_attachment_file_name :photo_file, :matches => [/png\Z/, /jpe?g\Z/, /gif\Z/]
  private
    def only_one_featured
      if self.featured
        Announcement.update_all(featured: false)
        self.featured = true
      end
    end
end
