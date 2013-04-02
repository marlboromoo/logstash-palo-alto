ElasticSearch Configuration
================================

Overview
--------

These are my current configurations for sending Palo Alto logs to ElasticSearch
via Logstash. 

These are the configurations for ElasticSearch, if you hadn't figured that out.

I've set up ElasticSearch to listen on the loopback/127.0.0.1 because it doesn't
have ACL capabilities. 

I've set up Nginx as a proxy and ACL'd off IP addresses with the exception of
those I'd like to grant access via cleartext. Given the nature of firewall logs,
you likely don't want to use this in lieu of something like stunnel. There's
various solutions around this problem, this is what I'm doing for now.

In the future, this will probably have user-based access, but for the time being.

Stunnel Access
--------------

My Kibana node and eventually all access is via stunnel on port 10200. This port
is then ACL'd off to only specific hosts. 

Configuration
-------------

It's easiest to set this up on a test instance so you can quickly delete things.

I've created tempaltes for the syslog data from the PA devices. It will map the
various types to the appropriate ES data types for queries. Some of them may
be incorrect, though - but I haven't had any issues with ~500 GB of log data.

Run each of the following scripts:
 * es-logstash-pa-traffic-template.sh
 * es-logstash-pa-threat-template.sh

Modify the Logstash configs to use the 'door' entries. They can be modified to
use any files anywhere. It's just important to keep 'door' files seperate
because the traffic log and the threat log have different field sizes.

Start up Logstash:

    java -jar logstash.jar agent -v -f logstash-main.conf 

It'll take a few minutes to start up, then run

    tail -2 user0<timestamp>.log >> /path/to/doorfile.log

Go back and look at your logstash log, and you hopefully should see it going
into ES just fine. If it's looping, there's a problem with the index.

This will likely take some trial and error to get right. You *do not* want
to run this on production data, just because of the firehose nature of it.

Helpful Things
--------------
There are plugins available for ES, two of them that are pretty useful are 
the following:

Head - a tool to query/view data in ES
https://github.com/mobz/elasticsearch-head

to install:

    bin/plugin -install mobz/elasticsearch-head

BigDesk - a performance tool
https://github.com/lukas-vlcek/bigdesk

To install:

    bin/plugin -install lukas-vlcek/bigdesk

