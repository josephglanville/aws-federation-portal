AWS Federation Proxy
====================

This is a simple and extendable Rails application that allows you to authenticate AWS console sessions via Active Directory

Requirements
------------

* Active Directory user with read privledges to the base DN containing your users

Configuration
-------------

### Active Directory

Active Directory settings can be configured in either `config/settings.yml` or `config/settings.local.yml`.

```yaml
 active_directory:
   domain: Domain FQDN i.e. corp.contoso.com
   server: Active Directory controller to connect to. i.e ad1.contoso.com
   base: Base DN to search for users. i.e cn=Users,dc=Contoso,dc=com
   query_user: Username to bind as
   query_password: Passord for bind user
```

### AWS Accounts

Currently the only backend for loading AWS accounts is YAML.
There is intention to support storing AWS accounts via ActiveRecord.
You can also implement your own backend, take a look at `lib/account_storage.rb`

The YAML backend uses Rails.settings so it too can be configured in either `config/settings.yml` or `config/settings.local.yml`.

```yaml
aws_accounts:
   AccountNameHere:
     access_key_id: The AWS access key ID for this account
     secret_access_key: The AWS secret key for this account
```

TODO
----

* Implement policy support (atm all sessions are unrestricted)
* Implement group -> policy mapping
