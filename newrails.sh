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
echo "======================="
echo "gem \"therubyracer\"" >> Gemfile
echo "gem \"less-rails\"" >> Gemfile
echo "gem \"twitter-bootstrap-rails\"" >> Gemfile
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
rails g bootstrap:install less
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

echo "======================="
echo " Rails server"
echo "======================="
rails s


