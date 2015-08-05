# SpacialDB

This is the SpacialDB customer facing application

It will handle:

* Signup/Signin/Accounts
* Management Plans/Subscriptions including: creation, cancellation, upgrades and downgrades
* Provisioning via Digital Ocean


##Run in Linux

* `git clone git@github.com:nomadlabs/spacialdb.git`

* Connect to postgres with `sudo su - postgres`, and run `psql`

*  `create role myUserName login;` and  `\q`

* In postgres console execute `createdb spacialdb_development`

* Then `Ctrl+D` && `rake db:migrate`