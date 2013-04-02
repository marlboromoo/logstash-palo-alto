Palo Alto Configuration
=============================

I imagine this is possible to do via the commandline, but these
instructions are for the GUI.

Log Overview
--------------------
Palo Alto firewalls can output logs based on rules to syslog. This can be 
enabled per-rule, but in this case, there's an any any rule that's simpy 
sniffing the traffic. So all traffic is being sent to the syslog server. 
The Palo Alto syslog format contains basic syslog information as well as csv 
for the traffic. The format looks like this:

    <timestamp> <device name> <THREAT/TRAFFIC csv>

There are two main categories of csv data coming from the syslog. The first 
is the traffic log, which reports on all the traffic passing through the 
firewall. This includes source/destination IPs and ports as well as session 
length and byte counts - essentially up to layer 4 information. The other log 
is the threat log, which contains the URL information as well as information 
about any malware.

Configuration Steps
---------------------

Create a syslog server entries. You'll want to create at least two of them. 
One will be for the traffic logs, the other will be for the threat logs. I named 
mine syslog.example.com-LOG-USER for traffic and syslog.example.com-LOG-LOCAL 
for threat.

Next, go to Device->Server Profiles->Syslog and click 'Add' at the lower left 
part of the screen, and enter the 'hostname-facility' in the Name field. Next, 
click 'Add', and add your syslog name in the name and server fields, and set 
the facility based on the name you set. This document assumes you are setting
LOG-USER for TRAFFIC syslogs and LOG-LOCAL[0-4] for THREAT logs. I created host 
entries for LOG_USER, and LOG_LOCAL0 through LOG_LOCAL4. You can just do 
LOG_USER and LOG_LOCAL0 if you would prefer. Then click 'OK' to save your settings.

Then, go to Objects -> Log Forwarding. I named this the same as my syslog server,
you can name it whatever you would like.  In traffic settings, set the syslog 
to the syslog.example.org-LOG_USER created in the previous step. Under threat
settings, set the syslog entries either to syslog.example.org-LOG_LOCAL0 through
syslog.example.org-LOG_LOCAL4 or all the same setting for LOG_LOCAL4. Then click
'OK' to save your settings.

After that, you'll need to apply the syslog entry to a rule on your firewall and
push the config.

