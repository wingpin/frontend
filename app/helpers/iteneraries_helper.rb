module ItenerariesHelper
  
  def add_itenerary_leg_link(name, form)
    itenerary_leg = render(:partial => 'itenerary_leg', :locals => { :form => form })
    javascript = %{
    var new_itenerary_leg_id = $('.itenerary_leg').length + 1;
    $('#itenerary_legs').append("#{ escape_javascript itenerary_leg }".replace("_attributes][0]", "_attributes[" + new_itenerary_leg_id + "]"));
    }
    link_to_function name, javascript
  end
  
end
