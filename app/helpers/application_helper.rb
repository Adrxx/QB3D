module ApplicationHelper
  def full_field_qb(form,name,placeholder)
    str = ''
    str += form.text_field(name, class: 'campo', placeholder: placeholder)
    str += error_if_exists(form.object,name)
    str.html_safe      
  end

  
  def full_text_qb(form,name,placeholder)
    str = ''
    str += form.text_area(name, class: 'campo area', placeholder: placeholder)
    str += error_if_exists(form.object,name)
    str.html_safe      
  end

  def error_if_exists(object,name)
    str = ''
    object.errors[name].each do |m|
      str += "<div class='error-message'>#{m}</div>"
    end
    str
  end


end
