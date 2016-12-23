exim 4
======

This formula installs and configures Exim 4 on Debian.

Config example
--------------

Configuring it is done mainly from pillar.


```
exim:
  config:
    configtype: 'satellite'
    hide_mailname: 'true'
    ue4c_keepcomments: 'true'
    localdelivery: 'mail_spool'
    local_interfaces: ''
    minimaldns: 'false'
    other_hostnames: ''
    readhost: ''
    relay_domains: ''
    relay_nets: ''
    smarthost: ''
```
