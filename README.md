# pip

## ERRORS

on fedora docker image

```yaml
    TASK [cjsteel.pip : install pip3 requirements] *********************************
    FAILED - RETRYING: install pip3 requirements (3 retries left).
    FAILED - RETRYING: install pip3 requirements (2 retries left).
    FAILED - RETRYING: install pip3 requirements (1 retries left).
    fatal: [python_pip-fedora-latest]: FAILED! => {"attempts": 3, "changed": false, "failures": ["No package python3-venv available."], "msg": "Failed to install some of the specified packages", "rc": 1, "results": []}
    
    PLAY RECAP *********************************************************************
    python_pip-fedora-latest   : ok=1    changed=0    unreachable=0    failed=1    skipped=1    rescued=0    ignored=0
    
ERROR: 
```


TODO: [![Build Status](https://travis-ci.org/cjsteel/ansible-role-pip.svg?branch=master)](https://travis-ci.org/cjsteel/ansible-role-pip)

The purpose of this role is to install and configure pip on your system.

TODO: [Unit tests](https://travis-ci.org/cjsteel/ansible-role-pip) are done on every commit and periodically.

If you find issues, please register them in [GitHub](https://github.com/cjsteel/ansible-role-pip/issues)

To test this role locally please use [Molecule](https://github.com/metacloud/molecule):

```shell
# Docker test:
pip install molecule ara
molecule test
# Vagrant tests
molecule test --scenario-name vagrant
```
There are many scenarios available, please have a look in the `molecule/` directory.

## Context

This role is a part of a collection of compatible roles.

## Requirements


- A target system or VM with the packages required to run Ansible.
- Access to any repository(ies) containing any required packages.
- A recent version of Ansible. (Created using Ansible 2.8.2)

## Role Variables

- pip_parameter: Description of values. [default: value]

## Dependencies


- None known.

## Compatibility


This role has been tested against the following distributions and Ansible version:

|distribution|ansible 2.8.2|ansible 2.9.|ansible 3.0|ansible 3.1|ansible devel|
|------------|-----------|-----------|-----------|-----------|-------------|
|alpine-edge*|||||*|
|alpine-latest|||||*|
|archlinux|||||*|
|centos-6|||||*|
|centos-latest|||||*|
|debian-latest|||||*|
|debian-stable|||||*|
|debian-unstable*|||||*|
|fedora-latest|||||*|
|fedora-rawhide*|||||*|
|opensuse-leap|||||*|
|ubuntu-artful|||||*|
|ubuntu-devel*|||||*|
|ubuntu-latest|||||*|

A single star means the build may fail, it's marked as an experimental build.

## Example Playbook


```yaml
---
- name: pip
  hosts: all
  gather_facts: no
  become: yes

  roles:
    - role: cjsteel.bootstrap
    - role: cjsteel.pip
      pip_parameter: value
```

To install this role:
- Install this role individually using `ansible-galaxy install cjsteel.pip`

Sample roles/requirements.yml: (install with `ansible-galaxy install -r roles/requirements.yml

```yaml
---
- name: cjsteel.bootstrap
- name: cjsteel.pip
```

## Testing

### molecule testing and no_log and debug options

You will need to set the environment variable of `MOLECULE_DEBUG` to log errors, alternately you may prefer to debug manually by using the  `--debug` flag. Here is an example applied against the *vagrant* molecule scenario:

```text
molecule --debug create -s vagrant
```

## License

Apache License, Version 2.0

## Author Information

[Christopher Steel](https://cjsteel.github.io/) <chris.steel@gmail.com>

This role was generated using a modified version of Robert de Bock's excellent ansible-role-skeleton

* [github.com/robertdebock/ansible-role-skeleton](https://github.com/robertdebock/ansible-role-skeleton)

See Robert's personal site for many examples of high quality Linux flavour and version agnostic roles. 

* [Robert de Bock](https://robertdebock.nl/)

Other collections of great public facing Ansible roles:

* [DebOps - Maciej Delmanowski](https://github.com/debops)
* [Jeff Geerling](https://github.com/geerlingguy)

* [Larry Smith Jr.](https://github.com/mrlesmithjr)
