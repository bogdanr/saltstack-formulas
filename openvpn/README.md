OpenSSH
=======

This formula installs and partially configures OpenVPN.

Certificates and keys have to be generated manually.

Config example
--------------

Configuring the server or client is done mainly from pillar.

The most basic and practical server config looks like this:
```
openvpn:
  server:
    myserver1:
      server: '10.60.0.0 255.255.255.0'
      port: 1188
      proto: udp
      dev: tun
      dh: dh2048.pem
      ca: /etc/openvpn/easy-rsa/keys/ca.crt
      cert: /etc/openvpn/easy-rsa/keys/server.crt
      key: /etc/openvpn/easy-rsa/keys/server.key

```

If you also want to benefit from the config you'll have to use the `openvpn.config` state.

Inspired mostly from [here](https://github.com/saltstack-formulas/openvpn-formula).
