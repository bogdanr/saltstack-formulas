SaltStack Formulas
==================

This is meant to be dropped in any salt instalation so it would be good headstart with some frequently used generic formulas.

I am happy to accept support for new software. In order to get started on how to extend this, have a look at the already provided formulas, such as the [memcached](https://github.com/bogdanr/saltstack-formulas/tree/master/memcached) one.

**The purpose is to provide a stable repo which can be plugged in directly in SaltStack.**

All you have to do is create a new config file `/etc/salt/master.d/git-formulas.conf` with the following contents:

```
fileserver_backend:
  - git
  - roots

gitfs_remotes:
  - https://github.com/bogdanr/saltstack-formulas.git
```

After you restart the master the new files should be visible when you run `salt-run fileserver.file_list`. Depending on your Linux distro it might be required to [install GitPython](https://docs.saltstack.com/en/latest/topics/tutorials/gitfs.html#id3).

*Enjoy!*
