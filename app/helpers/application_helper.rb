module ApplicationHelper
  def connect_url account_type, itenerary_id

  end
  
  def link_to_social_account name, account_type, itenerary_id
    path = case account_type
    when 'via.me'
      "https://api.via.me/oauth/authorize/?client_id=#{Settings.viame.client_id}&redirect_uri=#{CGI.escape(viame_oauth_callback_url)}&response_type=token"
    else
      raise 'unsupported account type'
    end
    javascript = %{
     $.oauthpopup({
       path: "#{escape_javascript path}",
       callback: function(oauth_window_location){
         $.post( "#{escape_javascript social_accounts_path}", 
         {
           itenerary_id: "#{escape_javascript itenerary_id}",
           social_account: {
             account_type: "#{escape_javascript account_type}",
             token: oauth_window_location.toString()
           }
         },
         function(data, textStatus, jqXHR){
           window.location.reload();
         });
       }
     });
    }
    link_to_function name, javascript
  end
end
