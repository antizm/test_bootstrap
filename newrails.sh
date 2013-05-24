#!/bin/sh

TITLE=$1
if test -z "$1"; then
  TITLE="test_bootstrap"
fi
echo "======================="
echo " $TITLE"
echo "======================="


echo "======================="
echo " rails new $TITLE"
echo "======================="
rails new $TITLE

cd $TITLE

echo "======================="
echo " Append bootstrap Gems to Gemfile"
# gem "therubyracer"
# gem "less-rails"
# gem "twitter-bootstrap-rails"
echo "======================="
echo "gem 'therubyracer', '0.10.0'" >> Gemfile
echo "gem 'less-rails'" >> Gemfile
echo "gem 'twitter-bootstrap-rails'" >> Gemfile
#vi Gemfile

cd public
echo "======================="
echo " Remove index.html"
echo "======================="
mv index.html -index.html
cd ..

echo "======================="
echo " bundle install"
echo "======================="
bundle install

echo "======================="
echo " Install Bootstrap : less"
echo "======================="
#rails g bootstrap:install less
echo "======================="
echo " Install Bootstrap : static"
echo "======================="
rails g bootstrap:install static
echo "======================="
echo " Layout Bootstrap : application fluid"
echo "======================="
#rails g bootstrap:layout application fixed -f
rails g bootstrap:layout application fluid -f

#cd views/layouts
#vi application.html.erb

echo "======================="
echo " Rails Generate Scaffold : Post"
echo "======================="
rails g scaffold Post title:string description:text
echo "======================="
echo " Rake db:migrate"
echo "======================="
rake db:migrate
echo "======================="
echo " Themed Bootstrap Posts"
echo "======================="
rails g bootstrap:themed Posts -f

echo "======================="
echo " Edit config/routes.rb"
echo "======================="
#echo "root :to => 'posts#index'" >> config/routes.rb
awk 'NR==55{$0="  root :to => \x27posts#index\x27\n"$0}1' config/routes.rb > config/routes1.rb
mv -f config/routes1.rb config/routes.rb
#vi config/routes.rb
echo "======================="
echo " Rake routes"
echo "======================="
rake routes



# http://www.railsdeveloper.net/2010/06/rails-and-jquery-how-to-integrate-jquery-ui-into-your-rails-app/
echo "======================="
echo " Download jQuery : http://code.jquery.com"
echo "======================="
cd app/assets/javascript
wget http://code.jquery.com/jquery-1.9.1.min.js
cd ../../..


echo "======================="
echo " Please Download jQuery UI Theme : http://jqueryui.com/themeroller/"
echo "======================="
open http://jqueryui.com/themeroller/
# http://bash.cyberciti.biz/guide/Getting_User_Input_Via_Keyboard
read -p ""


echo "======================="
echo " copy" 
echo "   jquery-1.9.1.min.js" 
echo "   jquery-ui-1.10.3.custom.min.js"
echo " to"
echo "   app/assets/javascriptis"
echo "======================="
echo " copy" 
echo "   jquery-ui-1.10.3.custom.css"
echo " to"
echo "   app/assets/stylesheets"
echo "======================="
echo " copy" 
echo "   image folder"
echo " to"
echo "   app/assets/images"
echo "======================="
echo
echo
echo


echo "======================="
echo " Define  jQuery.js jQuery-ui.js jQuery-ui.css"
echo "  to     application.html.erb" 
echo "======================="
cd app/views/layouts
awk 'NR==14{$0="<%= stylesheet_link_tag \x27application\x27i, \x27jquery-ui-1.10.3.custom.css\x27 %>\n"$0}1' application.html.erb > application.html.erb1
mv -f application.html.erb1 application.html.erb
awk 'NR==15{$0="<%= javascript_include_tag :default %>\n"$0}1' application.html.erb > application.html.erb1
mv -f application.html.erb1 application.html.erb
awk 'NR==16{$0="<%= javascript_include_tag \x27jquery-1.9.1.min.js\x27, \x27jquery-ui-1.10.3.custom.min.js\x27 %>\n"$0}1' application.html.erb > application.html.erb1
mv -f application.html.erb1 application.html.erb
cd ../../..
echo
echo
echo



echo "======================="
echo " Edit app/views/posts/index.html"
echo "======================="




echo "======================="
echo " Rails server"
echo "======================="
#rails s


