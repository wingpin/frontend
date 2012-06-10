module ItenerariesHelper
  
  def add_itenerary_leg_link(name, form)
    itenerary_leg = render(:partial => 'itenerary_leg', :locals => { :form => form })
    javascript = %{
      var next_number = $('.itenerary_leg').length + 1;
      $('#itenerary_legs').append("#{ escape_javascript itenerary_leg }".replace(/\\_attributes\\]\\[1\\]/g, "_attributes[" + next_number + "]").replace(/attributes_1/g, "attributes_" + next_number ));
    }
    link_to_function name, javascript
  end
  
end
