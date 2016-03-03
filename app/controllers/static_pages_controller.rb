class StaticPagesController < ApplicationController


  def landing
    @materials = Material.all
    @announcements = Announcement.all
    if C4::Preference.first.nil?
      p = C4::Preference.new
      p.save
    end
    @contact = Contact.new
  end




end
