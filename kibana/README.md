Kibana Configuration
===================================

This is how I've configured Kibana. 

Kibana talks to a localhost:9200 port that is connected via stunnel to my
ElasticSearch node.

I've modified the KibanaConfig.rb to use my template schem and to include
more data for most things. As newer versions of Kibana come out, you
may need to merge those settings.
