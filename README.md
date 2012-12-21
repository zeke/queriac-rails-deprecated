Queriac
=======

The rails app that powers [queriac.com](http://queriac.com).

Development
-----------

```bash
bundle install
bundle exec rake db:create:all
bundle exec rake db:migrate
foreman start
```

You might need to set up some config vars, namely twitter OAuth stuff.
Fetch that from the heroku app config:

```bash
heroku config -a queriac | grep TWITTER
```

Testing
-------

```bash
guard start
```