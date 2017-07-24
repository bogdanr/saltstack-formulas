nodejs formula
==============

This one installs a specific nodejs version either from a package, binary or source.

Config example
--------------

### Install from package:
```
node:
  install_from_ppa: True
  version: 6.11.1-2nodesource1~stretch1
```

### Install from source:
```
node:
  version: 5.4.0
  install_from_source: True
  checksum: 1dfe37a00cf0ed62beb73071f571ac56697f544a98cc2ff3318faec6363d72ab
  make_jobs: 2
```

### Install from binary:
```
node:
  version: 5.4.0
  install_from_binary: True
checksum: f037e2734f52b9de63e6d4a4e80756477b843e6f106e0be05591a16b71ec2bd0
```
