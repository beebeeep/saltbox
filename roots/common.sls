#
# https://docs.saltstack.com/en/latest/ref/states/highstate.html
#

add_my_key:
  file.append:
    - name: /home/midanil/.ssh/authorized_keys
    - text: |
        ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCbzbkz4ZnnKKe4h5JPkiHfKUpNJV7bfcQpLhDje0NM8D86E825tCIK8dTChr06qS51oFJKxeY1X5aI+qsgikuQ2u/rkZUE4rGCk0EoH6Ejxblg5mVUNpnhfqp2E1yze1gSJSzENCyvfGvHYjdMs2SwYx2o0Lj9mi1RVr30x1k9dGhKnyDoCcUZMzoppVOSpJFpGoZ2mWcZsK0YVkqamNWVbGxfyg42waM8tO+bzYzNuHkaFEBHiqKBfBdAoEVDO+TYXMjjPZGU2pMEIWHigreUYGSMcIhp0hfV2aDP31R0cljuwS0epj/L6mSRyBUINzxGjTKa2A22LoZYFK/JaiZB

vim:                        # This is ID, must be globally unique within whole highstate
  pkg:                      # This is "state module" (namely, python module to call)
    - installed             # state module function to call
    - refresh: True         # function kwargs

install_other_pkgs:
  pkg.installed:            # module & function can also be referenced using dot notation
    - pkgs:                 # in that case it's function's kwarg 
        - strace
        - tcpdump
        - sysstat
  
