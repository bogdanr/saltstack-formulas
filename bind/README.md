collectd
========

This formula installs and configures BIND.

By default it will install the stable collectd version from the linux distro repo.

Config example
--------------

Configuring it is done mainly from pillar. It overrides for the defaults specified by map.jinja 

init.sls pillar:

```
bind:

  lookup:
    zones_source_dir: bind/zonedata               # Take zonefiles from `salt://bind/zonedata`

  config:
    options:
      allow-recursion: '{ any; }'                 # Never include this on a public resolver
    protocol: 4                                   # Force bind to serve only one IP protocol
    default_zones: True                           # If set to True, the default-zones configuration
                                                  # will be enabled. Defaults to False.
    includes:                                     # Include any additional configuration file(s)
      - /srv/additional/named.conf 

  keys:
    "core_dhcp":                                  # The name for our key
      secret: "YourSecretKey"                     # The key its self

  configured_zones:
    sub.domain.com:                               # First domain zone
      type: master                                # We're the master of this zone
      notify: False                               # Don't notify any NS RRs of any changes to zone
      also-notify:                                # Do notify these IP addresses (pointless as
        - 1.1.1.1                                 # notify has been set to no)
        - 2.2.2.2

    1.168.192.in-addr.arpa:                       # Reverse lookup for local IPs
      type: master                                # As above
      notify: False                               # As above
      allow-transfer:                             # As above
        - 1.1.1.1
        - 2.2.2.2

    dynamic.domain.com:                           # Our ddns zone
      type: master                                # As above
      allow-update: "key core_dhcp"               # Who we allow updates from (refers to above key)
      notify: True                                # Notify NS RRs of changes

    sub.anotherdomain.com:                        # Another domain zone
      type: forward                               # This time it's a forwarding zone
      forwarders:                                 # Where we need to forward requests to
        - 10.9.8.7
        - 10.9.8.5

    sub.forwardonlydomain.com:                    # Forwarding only domain
      type: forward                               # As above
      forward: only                               # We don't want the server to do any resulving
      forwarders:                                 # As above (but with different IPs)
        - 10.9.8.8
        - 10.9.8.9

  configured_views:
    myview1:                                      # First (and only) view
      match_clients:                              # The clients we wish to match
        - client1
        - client2
      configured_zones:                           # Zones that our view is applicable to
        my.zone:                                  # We've defined a new zone in here
          type: master
          notify: False
          update_policy:                          # A given update policy
            - "grant core_dhcp name dns_entry_allowed_to_update. ANY"

  configured_acls:                                # And now for some ACLs
    my_net:                                       # Our ACL's name
      - 127.0.0.0/8                               # And the applicable IP addresses
      - 10.20.0.0/16

  available_zones:
    sub.domain.org:
      file: db.sub.domain.org                     # DB file containing our zone
      masters:                                    # Masters of this zone
        - 192.168.0.1

```

Inspired mostly from [here](https://github.com/saltstack-formulas/bind-formula).
