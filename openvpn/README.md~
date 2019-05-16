OpenSSH
=======

This formula installs and configures OpenSSH.

It is mostly usefull to secure the openssh server.

Config example
--------------

Configuring it is done mainly from pillar.

```
sshd_config:
  Port: 22
  Protocol: 2
  HostKey:
    - /etc/ssh/ssh_host_rsa_key
    - /etc/ssh/ssh_host_dsa_key
    - /etc/ssh/ssh_host_ecdsa_key
    - /etc/ssh/ssh_host_ed25519_key
  UsePrivilegeSeparation: 'yes'
  KeyRegenerationInterval: 3600
  ServerKeyBits: 768
  SyslogFacility: AUTH
  LogLevel: INFO
  ClientAliveInterval: 0
  ClientAliveCountMax: 3
  LoginGraceTime: 120
  PermitRootLogin: 'yes'
  PasswordAuthentication: 'no'
  StrictModes: 'yes'
  MaxAuthTries: 6
  MaxSessions: 10
  RSAAuthentication: 'yes'
  PubkeyAuthentication: 'yes'
  AuthorizedKeysCommand: '/usr/bin/sss_ssh_authorizedkeys'
  AuthorizedKeysCommandUser: 'nobody'
  IgnoreRhosts: 'yes'
  RhostsRSAAuthentication: 'no'
  HostbasedAuthentication: 'no'
  PermitEmptyPasswords: 'no'
  ChallengeResponseAuthentication: 'no'
  AuthenticationMethods: 'publickey,keyboard-interactive'
  AuthorizedKeysFile: '%h/.ssh/authorized_keys'
  X11Forwarding: 'yes'
  X11DisplayOffset: 10
  PrintMotd: 'no'
  PrintLastLog: 'yes'
  TCPKeepAlive: 'yes'
  AcceptEnv: "LANG LC_*"
  Subsystem: "sftp /usr/lib/openssh/sftp-server"
  UsePAM: 'yes'
  UseDNS: 'yes'
  AllowUsers: 'vader@10.0.0.1 maul@evil.com sidious luke'
  DenyUsers: 'yoda chewbaca@112.10.21.1'
  DenyGroups: 'rebel'
  matches:
    sftp_chroot:
      type:
        Group: sftpusers
      options:
        ChrootDirectory: /sftp-chroot/%u
        X11Forwarding: no
        AllowTcpForwarding: no
        ForceCommand: internal-sftp
```


Inspired mostly from [here](https://github.com/saltstack-formulas/openssh-formula).
