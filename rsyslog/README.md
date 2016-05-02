rsyslog
=======

This formula installs and configures rsyslog.

By default it will install the stable rsyslog version from the linux distro repo.

Config example
--------------

Configuring it is done mainly from pillar. In a multiserver environment with centralized logging there will be a client.sls and a server.sls pillar.

client.sls pillar:
```
rsyslog:
  target: 192.168.100.1
```

server.sls pillar:
```
rsyslog:
  listenudp: true
```

For either the client of the server, additional flexibility can be accomplished with these optionns:
```
  custom:                                 # Put custom config files in /etc/rsyslog.d/.
    - 001_custom1.conf                    # Files must be reachable from path `salt://rsyslog/`
    - salt://some_other/002_custom2.conf  # Or with an absolute path.
                                          # The default is to include `salt://rsyslog/files/50-default.conf`.
                                          # If you change the custom conf dict, make sure to
                                          # include the 50-default.conf as well if needed.
```


Inspired mostly from [here](https://github.com/saltstack-formulas/rsyslog-formula).
