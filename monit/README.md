monit
=====

This formula installs and configures Monit on Debian.

Config example
--------------

Configuring it is done mainly from pillar.


```
modules:
  nginx:
    process:
      with:
        pidfile: /var/run/nginx.pid
      config:
        group: www
        start: "/etc/init.d/nginx start"
        stop: "/etc/init.d/nginx stop"
      if:
        failed: host 127.0.0.1 port 80 protocol http
        action: restart
```
