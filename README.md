How to run:
===========

on Heroku.com
-------------
You'll need the heroku gem:

	$ gem install heroku

Clone our example repository:

	$ git clone git://github.com/fxtentacle/bubo-example.git
	Initialized empty Git repository in ~/bubo-example/.git/
	remote: Counting objects: 354, done.
	remote: Compressing objects: 100% (249/249), done.
	remote: Total 354 (delta 166), reused 210 (delta 84)
	Receiving objects: 100% (354/354), 117.00 KiB | 118 KiB/s, done.
	Resolving deltas: 100% (166/166), done.

Create a new heroku app:

	$ cd bubo-example/
	$ heroku create
	Creating severe-sunrise-782..... done
	Created http://severe-sunrise-782.heroku.com/ | git@heroku.com:severe-sunrise-782.git
	Git remote heroku added

And deploy the example:

	$ git push heroku master
	Counting objects: 354, done.
	Delta compression using up to 2 threads.
	Compressing objects: 100% (167/167), done.
	Writing objects: 100% (354/354), 119.90 KiB, done.
	Total 354 (delta 166), reused 354 (delta 166)
	
	-----> Heroku receiving push
	-----> Rails app detected

	-----> Installing gem rails 2.3.10 from http://rubygems.org
	       Successfully installed activesupport-2.3.10
	       Successfully installed activerecord-2.3.10
	       Successfully installed rack-1.1.0
	       Successfully installed actionpack-2.3.10
	       Successfully installed actionmailer-2.3.10
	       Successfully installed activeresource-2.3.10
	       Successfully installed rails-2.3.10
	       7 gems installed

	-----> Installing gem bubo 0.0.5 from http://rubygems.org
	       Successfully installed bubo-0.0.5
	       1 gem installed

	       Compiled slug size is 7.8MB
	-----> Launching... done
	       http://severe-sunrise-782.heroku.com deployed to Heroku

**Install Bubo add-on**

Let's first check if it works already ...
	
	$ heroku console ImagesController.crawler_status
	JSON::ParserError: 655: unexpected token at 'Please specify email and api_key.'
	
Well, that was to be expected. The bubo gem doesn't have any login credentials yet.

	$ heroku addons:add bubo
	Adding bubo to severe-sunrise-782... done (free)
	
	$ heroku console ImagesController.crawler_status
	{"FAIL"=>0, "OK"=>0, "TODO"=>0, "UPDATE"=>"IDLE"}
	
Yup, it works :) 
In case you'd like to interact directly with your Bubo database, you can get your BUBO_LOGIN from heroku:

	$ heroku config --long
	BUBO_LOGIN          => bubo://api.askbubo.com:80?app404409@heroku.com:5d34d9710847f902c3a0cd9fae728e69
	...

on Localhost
------------

Please go to http://api.askbubo.com/users/new and create your BUBO_LOGIN url.

	$ git clone git://github.com/fxtentacle/bubo-example.git
	$ cd bubo-example/
	
	$ export BUBO_LOGIN='bubo://api.askbubo.com:80?email@example.com:SOMEGIBBERISHAPIKEY'
	$ ./script/server 
	
	
