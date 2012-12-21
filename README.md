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

Fetch Twitter OAuth credentials from the heroku app config:

```bash
heroku config -a queriac | grep TWITTER
```

[dnsimple](http://dnsimple.com) credentials are in there too:

```bash
heroku config | grep DNS
```

Testing
-------

```bash
guard start
```