class Announcement < ActiveRecord::Base
  
  before_save :only_one_featured


  private
    def only_one_featured
      if self.featured
        Announcement.update_all(featured: false)
        self.featured = true
      end
    end
end
