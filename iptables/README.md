iptables
========

This formula configures iptables.
Be very carefull when setting `strict: True` because it sets the policy to DROP.

Config example
--------------

```
firewall:
  install: True
  enabled: True
  strict: True
  services:
    ssh:
      block_nomatch: False
      ips_allow:
        - 192.168.0.0/24
        - 10.0.2.2/32
    http:
      block_nomatch: False
      protos:
        - udp
        - tcp
    snmp:
      block_nomatch: False
      protos:
        - udp
        - tcp
      interfaces:
        - eht0

  whitelist:
    networks:
      ips_allow:
        - 10.0.0.0/8

  nat:
    eth0:
      rules:
        '192.168.18.0/24':
          - 10.20.0.2
        '192.168.18.0/24':
          - 172.31.0.2
          - 10.0.0.0/8
```

Inspired mostly from [here](https://github.com/saltstack-formulas/iptables-formula)
