
Palo Alto Firewalls with Logstash
=============================================

Various configurations and setup for making logstash work with Palo Alto 
Firewall syslog output.

The general pipeline here is:
First:
[PA FW] -> syslog -> [rsyslog] -> [Disk]
Then:
[Disk] -> [Logstash Input] -> [Logstash Filters] -> [Output to ElasticSearch]

Users access like this:
[Web Browser] -> https -> [Kibana SSL] -> stunnel -> [ElasticSearch]

The Palo Alto Firewalls do not support Syslog via SSL, however most
everything else in the chain should be encrypted.

Each directory contains instructions for that individual portion of things.
There may be pieces missing, however.

This is a Version 1 of this. I'm working on a second revision of the whole setup
that will be more scalable. 

Known Issues
==============================================
 * For some reason my firewall is giving double syslog entries for everything.
 * My ES hardware is pretty decent, and this won't keep up with a 1.5k/event
 stream. By mid-afternoon, I'm about an hour behind. I'm working on another
 revision of this to hopefully fix this on the same harware.
