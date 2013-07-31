# Whoopsy

Whoppsy provides an awesome CLI Interface to Whoops Logger (http://www.whoopsapp.com/whoops-logger/).

Consult the whoopsy_logger gem http://www.whoopsapp.com/whoops-logger/) for more detailed information.  This Gem is a simple wrapper for that library.

## Installation

Add this line to your application's Gemfile:

    gem 'whoopsy'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install whoopsy

## Usage

Make sure you have installed your whoops_server first! http://www.whoopsapp.com/whoops-server/

Once installed the minimum options to connect to the whoops_server are:

 * --host fqdn
 * --port 80

These options can be specified in a configuration file or on the command line.  The configuration files supported in order of priority are:

 * /etc/whoopsy.yml
 * $HOME/.whoopsy.yml
 * $WHOOPSY_CONFIG (full path to file)

The following connection parameters are supported:

 * --host
 * --http_open_timeout
 * --http_read_timeout
 * --port
 * --protocol
 * --proxy_host
 * --proxy_pass
 * --proxy_port
 * --proxy_user
 * --secure

(These options come directly from the whoopsy_logger gem http://www.whoopsapp.com/whoops-logger/)

A sample config file might look like:
```yaml
:host: localhost
:port: 3000
```

Note that the command line options will override any options specified in the configuration files.

You must specify the additional required paramters to send a message to the whoops_server:

 * --event-type
 * --service
 * --environment
 * --message
 * --event-group-identifier

Here is an example command line:

```bash
whoopsy --host whoops.example.com --port 80 --event-type "warning" --service "my script" --environment "development" --message "working ok today" --event-group-identifier "group7"
```
## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
