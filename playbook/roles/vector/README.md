Vector
=========

This role install vector


Role Variables
--------------

| vars | Description | Value |
|------|------------|---|
| vector_version | Vector version to install | "0.28.1" |
| vector_config_dir | Vector config file location | "/etc/vector" |

Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

    - hosts: servers
      roles:
         - { role: vector-role }

License
-------

MIT

Author Information
------------------

Sergey Prokofev
