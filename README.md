# ansible-role-pip

[![Build Status](https://travis-ci.org/cjsteel/ansible-role-pip.svg?branch=master)](https://travis-ci.org/cjsteel/ansible-role-pip)
[![Ansible Galaxy](http://img.shields.io/badge/ansible--galaxy-pip-blue.svg)](https://galaxy.ansible.com/cjsteel/pip/)

## Description

An Ansible role for creating virtualenv's and installing pip packages via the `pip install <package_name>` method or using a pip requirements file as in pip install -r requirements.txt`

## Notes

* currently actively tested using **LXD** as the Molecule provider.

## Roadmap

* [ROADMAP.md](./ROADMAP.md)

Requirements
------------

The Ansible pip module is used and all requirements are installed by this role including:

* pip
* virtualenv
* setuptools

epel is require for RedHat systems and may be added as a role dependency at a later date.

Role Variables
--------------

All role variables as well as testing examples are included in `defaults/main.yml` here:

* [defaults/main.yml](defaults/main.yml)

and can be overridden as seen in the **Example Playbook** section.

Dependencies
------------

* epel is require for RedHat systems and may be added as a role dependency at a later date.

Example Playbook
----------------

Here are a couple of realworld usage examples:

### pip install some_package example

Here we create a virtualenv with python2.7 and install molecule and all dependencies into it. In addition we install the **docker** pip package into the same virtualenv. We need to specify the `pip_install_type` of **packages** to use the `pip install package` method:

```yaml
- hosts: servers
  vars:
    pip_debug: true
    pip_install_type: 'packages'

    pip_install_from_packages:
    
      - name: molecule
        state: present
        version: "2.20.0.0a1"
        # parent dir of virtualenv below will be the remote home dir
        virtualenv: .venv/molecule/2.20.0.0a1
        virtualenv_python: python2.7

      - name: docker
        state: present
        virtualenv: .venv/molecule/2.20.0.0a1

  roles:
     - role: cjsteel.pip
```

### pip install using a custom requirements.txt file

Alternatively you can use `pip freeze > files/requirements-your-custom.txt`  to generate a pip requirements file from an existing virtualenv and add it to the roles `files/` directory. You will need to override the `pip_requirements_file_src` variable as demonstrated in the playbook below as well as any other custom variable values before running the role. IMPORTANT, your custom requirements file, say `files/requirements-your-custom.txt` will be renamed to be `requirements.txt` so you should override `pip_requirements_file_src` only.

 We need to specify the `pip_install_type` of **requirements** in order to install to our virtualenv using the  `pip install -r requirements.txt` method:

```yaml
- hosts: servers
  vars:
    pip_debug: true
    pip_install_type: 'requirements'
    
    pip_requirements_file_src: requirements-your-custom.txt
    pip_install_from_requirements_file:
      - name: molecule
        requirements: requirements.txt
        # parent dir of virtualenv will be remote home dir
        virtualenv: "{{ pip_default_virtualenv }}"
        virtualenv_python: "{{ pip_python_version }}"

```

## Testing

### Manual

```shell
molecule converge -s lxd
molecule login -s lxd -h pip-xenial
source ~/.venv/molecule/2.20.0.0a1/bin/activate
molecule init role -r myrole
cd myrole/
ls -al
```



License
-------

MIT/BSD

Author Information
------------------

- [Christopher Steel](http://mcin-cnim.ca/) | [e-mail](mailto:christopher.steel@mcgill.ca)

Inspiration
-----------

* [geerlingguy - ansible-role-pip](https://github.com/geerlingguy/ansible-role-pip)
* [cchurch - ansible-role-virtualenv](https://github.com/cchurch/ansible-role-virtualenv/)
