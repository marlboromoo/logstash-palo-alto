curl -XPUT http://localhost:9200/_template/logstash_pa_threat -d '
{
    "template" : "logstash-pa-threat-*",
    "settings" : {
        "number_of_shards" : 1,
        "number_of_replicas" : 0,
        "index.cache.field.type" : "soft",
        "index.refresh_interval" : "5s",
        "index.store.compress.stored" : true,
        "index.query.default_field" : "@message",
        "index.routing.allocation.total_shards_per_node" : 4
    },
    "mappings" : {
        "_default_" : {
            "_all" : {"enabled" : false},
            "_source": { "compress": true },
            "properties" : {
               "@fields" : {
                    "type" : "object",
                    "dynamic": true,
                    "path": "full",
                    "properties" : {
                        "Action" : { "type": "string", "index": "not_analyzed" },
                        "Application" : { "type": "string", "index": "not_analyzed" },
                        "Category" : { "type": "string", "index": "not_analyzed" },
                        "ConfigVersion" : { "type": "integer", "index": "not_analyzed" },
                        "DestinationAddress" : { "type": "ip" },
                        "DestinationAddressResolved" : {"type": "string"},
                        "DestinationCountry" : { "type": "string", "index": "not_analyzed" },
                        "DestinationPort" : { "type": "integer" },
                        "DestinationUser" : { "type": "string", "index": "not_analyzed" },
                        "DestinationZone" : { "type": "string", "index": "not_analyzed" },
                        "Direction" : { "type": "string", "index": "not_analyzed" },
                        "Flags" : { "type": "string", "index": "not_analyzed" },
                        "GenerateTime" : { "type": "date", "format": "yyyy/MM/dd HH:mm:ss||yyyy/MM/dd", "index": "not_analyzed" },
                        "IPProtocol" : { "type": "string", "index": "not_analyzed" },
                        "InboundInterface" : { "type": "string", "index": "not_analyzed" },
                        "LogAction" : { "type": "string", "index": "not_analyzed" },
                        "NATDestinationIP" : { "type": "ip" },
                        "NATDestinationPort" : { "type": "integer", "index": "not_analyzed" },
                        "NATSourceIP" : { "type": "ip" },
                        "NATSourcePort" : { "type": "integer", "index": "not_analyzed" },
                        "OutboundInterface" : { "type": "string", "index": "not_analyzed" },
                        "PaloAltoDomain" : { "type": "string", "index": "not_analyzed" },
                        "ReceiveTime" : { "type": "date", "format": "yyyy/MM/dd HH:mm:ss||yyyy/MM/dd", "index": "not_analyzed" },
                        "RepeatCount" : { "type": "integer", "index": "not_analyzed" },
                        "Rule" : { "type": "string", "index": "not_analyzed" },
                        "SerialNum" : { "type": "string", "index": "not_analyzed" },
                        "SessionID" : { "type": "long", "index": "not_analyzed" },
                        "Severity" : { "type": "string", "index": "not_analyzed" },
                        "SourceAddress" : { "type": "ip" },
                        "SourceAddressResolved" : {"type": "string"},
                        "SourceCountry" : { "type": "string", "index": "not_analyzed" },
                        "SourcePort" : { "type": "integer" },
                        "SourceUser" : { "type": "string", "index": "not_analyzed" },
                        "SourceZone" : { "type": "string", "index": "not_analyzed" },
                        "Threat-ContentType" : { "type": "string", "index": "not_analyzed" },
                        "Threat-ContentName" : { "type": "string", "index": "not_analyzed" },
                        "TimeLogged": { "type": "date", "format": "yyyy/MM/dd HH:mm:ss||yyyy/MM/dd", "index": "not_analyzed" },
                        "Type" : { "type": "string", "index": "not_analyzed" },
                        "URL" : { "type": "string", "index": "not_analyzed" },
                        "VirtualSystem" : { "type": "string", "index": "not_analyzed" },
                        "actionflags" : { "type": "string", "index": "not_analyzed" },
                        "contenttype" : { "type": "string", "index": "not_analyzed" },
                        "cpadding" : { "type": "string", "index": "not_analyzed" },
                        "seqno" : { "type": "long", "index": "not_analyzed" }
                    }
               },
               "@message": { "type": "string", "index": "analyzed" },
               "@source": { "type": "string", "index": "not_analyzed" },
               "@source_host": { "type": "string", "index": "not_analyzed" },
               "@source_path": { "type": "string", "index": "not_analyzed" },
               "@tags": { "type": "string", "index": "not_analyzed" },
               "@timestamp": { "type": "date", "index": "not_analyzed" },
               "@type": { "type": "string", "index": "not_analyzed" }
            }
        }
    }

}
'
