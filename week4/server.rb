require 'sinatra'
require 'pony'

get '/' do
  erb :form
end

post '/' do
  @email = params[:email]
  @from_email = params[:from]
  @subject = params[:subject]
  @message = params[:message]

  Pony.options= {
    :via => 'smtp',
    :via_options => {
      :address => 'smtp.mailgun.org',
      :port => '587',
      :enable_starttls_auto => true,
      :authentication => :plain,
      :user_name => '<your username here>',
      :password => '<your password here>',
    }
  }

  message = {
    :from => @from_email,
    :to => @email,
    :subject => @subject,
    :body => @message
  }

  Pony.mail(message)

  erb :result
end

