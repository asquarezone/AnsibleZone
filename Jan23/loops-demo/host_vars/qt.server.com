---
ansible_host: localhost
packages:
  - git
  - nano
  - net-tools
  - tree