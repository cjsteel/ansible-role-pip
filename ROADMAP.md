# ROADMAP.md

### TODO

* epel dependency?
* fix Travis error when using requirements.txt file
* add slack notifications to .travis.yml

Travis slack notifications example:

```shell

```

## Testing issues

### molecule test

```shell
--> Scenario: 'default'
--> Action: 'idempotence'
ERROR: Idempotence test failed because of the following tasks:
* [pip-bionic] => cjsteel.pip : Waiting for unattended updates to complete
* [pip-bionic] => cjsteel.pip : Waiting for apt system update to complete
An error occurred during the test sequence action: 'idempotence'. Cleaning up.
```

### molecule test -s lxd

```shell
--> Scenario: 'lxd'
--> Action: 'idempotence'
ERROR: Idempotence test failed because of the following tasks:
* [pip-xenial] => cjsteel.pip : Waiting for unattended updates to complete
* [pip-xenial] => cjsteel.pip : Waiting for apt system update to complete
```

### molecule test -s vagrant

```shell
--> Scenario: 'vagrant'
--> Action: 'idempotence'
ERROR: Idempotence test failed because of the following tasks:
* [pip-bionic] => cjsteel.pip : Waiting for unattended updates to complete
* [pip-bionic] => cjsteel.pip : Waiting for apt system update to complete
An error occurred during the test sequence action: 'idempotence'. Cleaning up.
```



## 2019-03-13 - completed

* README.md
* delint

