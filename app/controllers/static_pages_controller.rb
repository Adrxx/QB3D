class StaticPagesController < ApplicationController
  def home
  end

  def parati
    @announcements = Announcement.all
    if Preference.first.nil?
      p = Preference.new
      p.save
    end
    @prefs = Preference.first
    @contact = Contact.new
  end

  def envianos
    @materials = Material.all
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
