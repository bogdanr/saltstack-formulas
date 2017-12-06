PostgreSQL Formula
=============

This formula allows you to install and configure the PostgreSQL server

Config example
--------------

```
postgres:
  # Additional packages to install with PostgreSQL server
  pkgs_extra:
    - postgresql-contrib
    - postgresql-plpython

  acls:
    - ['local', 'db1', 'localUser']
    - ['host', 'db2', 'remoteUser', '192.168.33.0/24']

  users:
    localUser:
      ensure: present
      password: '98ruj923h4rf'
      createdb: False
      createroles: False
      createuser: False
      inherit: True
      replication: False

    remoteUser:
      ensure: present
      password: '98ruj923h4rf'
      createdb: False
      createroles: False
      createuser: False
      inherit: True
      replication: False

    absentUser:
      ensure: absent

  tablespaces:
    my_space:
      directory: /srv/my_tablespace
      owner: localUser

  databases:
    db1:
      owner: 'localUser'
      template: 'template0'
      lc_ctype: 'en_US.UTF-8'
      lc_collate: 'en_US.UTF-8'
    db2:
      owner: 'remoteUser'
      template: 'template0'
      lc_ctype: 'en_US.UTF-8'
      lc_collate: 'en_US.UTF-8'
      tablespace: 'my_space'
      schemas:
        public:
          owner: 'localUser'
```

Inspired mostly from [here](https://github.com/saltstack-formulas/postgres-formula).
