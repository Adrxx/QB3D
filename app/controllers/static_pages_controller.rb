class StaticPagesController < ApplicationController


  def landing
    @materials = Material.all
    @announcements = Announcement.all
    if Preference.first.nil?
      p = Preference.new
      p.save
    end
    @prefs = Preference.first
    @contact = Contact.new
  end

  def enviar_contacto
    @prefs = Preference.first
    @contact = Contact.new(params[:contact])
    @contact.request = request

    if @contact.deliver
      render partial: 'contacto_success'
    else
      render partial: 'contacto'
    end
  end



end
