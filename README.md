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

[DNSimple](https://dnsimple.com/domains/queriac.com) credentials are in there too:

```bash
heroku config -a queriac | grep DNS
```

Generating the App Manifest

```bash
# npm install -g cson jsontool
rake manifest
```

Testing
-------

```bash
bundle exec guard start
```