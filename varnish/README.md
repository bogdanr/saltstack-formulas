Varnish formula
===============

This formula allows you to install and configure the Varnish server

Config example
--------------

```
varnish:
  listen: ':80'
  storages:
    - 'main=malloc,1G'
    - 'secondary=malloc,256m'
  params:
    default_ttl: 120
    default_grace: 10
    thread_pool_min: 50
    thread_pool_max: 1000
    thread_pool_timeout: 120

  extra_options: '-u varnish -g varnish -w 500,1500,60'

  # VCL templates and pillar values used in them
  vcl:
    version: '3.0'
    backend_default_host: 10.1.1.1
    backend_default_port: 80
    files:
      - default.vcl
    files_absent:
      - absent.vcl
```

Inspired mostly from [here](https://github.com/saltstack-formulas/varnish-formula).
