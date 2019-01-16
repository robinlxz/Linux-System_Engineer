#Maintain by 
#Referrence: 
#Update Huawei server network card driver to 2.4.6

/home/fo4-gto:
 file.directory:
  - user: root
  - name: /home/fo4-gto
  - group: root
  - mode: 755

get_driver_on_Akamai:
 file.managed:
  - name: /home/fo4-gto/NIC-X710_XL710_X722-Ubuntu16.04.1-i40e-2.4.6.tar.gz
  - source: http://dl.garenanow.com/games/fo3vn/patcher/NIC-X710_XL710_X722-Ubuntu16.04.1-i40e-2.4.6.tar.gz
  - source_hash: 830e0b47c405d2dc0d2bbe46c3451ad0

untar_file:
 module.run:
  - name: archive.tar
  - options: zxf
  - tarfile: /home/fo4-gto/NIC-X710_XL710_X722-Ubuntu16.04.1-i40e-2.4.6.tar.gz
  - dest: /home/fo4-gto/

make:
 pkg.latest:
  - refresh: True

build-essential:
 pkg.latest:
  - refresh: True

cmd-test:
 cmd.run:
  - name: |
     cd /home/fo4-gto/i40e-2.4.6/src/
     make
     make install
     rmmod i40e;modprobe i40e
     ethtool -i eno1|grep 2.4.6