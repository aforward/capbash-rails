capbash-rails
==============

Scripts for installing [rails](https://github.com/railsframework/rails), should be used in conjunction with capbash

# How to Install #

Install capbash first, more details at:
https://github.com/aforward/capbash

```
curl -s https://raw.githubusercontent.com/aforward/capbash/master/capbash-installer | bash
capbash new YOUR_REPO_ROOT
cd YOUR_REPO_ROOT
```

Now you can install rails into your project

```
capbash install rails
```

# Configurations #

The available configurations include:

```
ELIXIR_VEION=${ELIXIR_VERSION-master}
RAILS_NAME=${RAILS_NAME-samplerails}
RAILS_DIR=${RAILS_DIR-/var/apps/${RAILS_NAME}}
RAILS_REPO=${RAILS_REPO-git@github.com:aforward/samplerails.git}
RAILS_HTTP_PORT=${RAILS_PORT-80}
RAILS_SSL_PORT=${RAILS_PORT-443}
```


# Deploy to Remote Server #

To push the rails script to your server, all you need if the IP or hostname of your server (e.g. 192.167.0.48) and your root password.

```
capbash deploy <IP> rails
```

For example,

```
capbash deploy 127.0.0.1 rails
```
