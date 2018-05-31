Supervisor
==========

This formula installs and configures Supervisor.

Config example
--------------

Configuring it is done mainly from pillar.

```
supervisor:
  programs:
    my-app:
      enabled: True # The program.conf can be removed with this variable
      autorestart: 'true'
      autostart: 'true'
      redirect_stderr: 'true'
      startsecs: '5'
      stdout_logfile_maxbytes: '50MB'
      stdout_logfile_backups: '10'
      command: /opt/app/my-app/bin/my-app.sh
      user: 'root'
      startretries: '10'
      directory: '/opt/app/my-app/bin'
      stdout_logfile: '/var/log/my-app/my-app.log'
```


Inspired mostly from [here](https://github.com/bigbosst/supervisor-formula).
