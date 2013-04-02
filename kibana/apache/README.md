Kibana Apache Config
=========================

You probably want to run Kibana under Passenger to enable authentication.

Examples for doing this can be found in the Kibana repo:
https://github.com/rashidkpc/Kibana/tree/kibana-ruby/sample/apache

You probably also want to enable SSL, even if it's just a self-signed cert
because of the nature of Firewall data.
