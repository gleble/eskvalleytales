ActionMailer::Base.smtp_settings = {  
:address              => "smtp.live.com",  
:port                 => 587,  
:domain               => "asciicasts.com",  
:user_name            => "neil_bye@hotmail.com",  
:password             => "souhamI%",  
:authentication       => "plain",  
:enable_starttls_auto => true  
 }  
