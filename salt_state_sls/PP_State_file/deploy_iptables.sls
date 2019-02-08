disable_ufw:
 cmd.run:
  - name: ufw disable

iptables-persistent:
  pkg.latest:
    - refresh: True

/etc/sysconfig:
  file.directory:
    - user: root
    - group: root
    - mode: 755

rename_rules_v4:
  file.rename:
    - name: /etc/iptables/original_rules.v4
    - source: /etc/iptables/rules.v4

/etc/iptables/rules.v4:
  file.managed:
    - source: salt://files/iptables/iptables_gpc

/etc/sysconfig/iptables:
  file.symlink:
    - target: /etc/iptables/rules.v4