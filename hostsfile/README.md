hosts management
================

This formula sets up all salt members in /etc/hosts.

To use it, you must enable the `network.ip_addrs` function in pillar.

```
mine_functions:
  network.ip_addrs: []
```

Config example
--------------

```
hostsfile:
  domain: example.com

```

You can also add entries for non-mine hosts as well:

```
hostsfile:
  hosts:
    server1: 10.10.10.10
    server2: 10.10.10.11
```

Inspired mostly from [here](https://github.com/saltstack-formulas/hostsfile-formula).
