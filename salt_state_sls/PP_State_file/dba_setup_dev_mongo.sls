#---------------- prepare user and folders ----------------
mongodb:
  user.present:
    - createhome: False

/dbdata:
  file.directory:
    - user: mongodb
    - group: mongodb
    - makedirs: True
    # - clean: True

/dbdata/primary:
  file.directory:
    - user: mongodb
    - group: mongodb
    - makedirs: True

/dbdata/config:
  file.directory:
    - user: mongodb
    - group: mongodb
    - makedirs: True

/opt/mongodb:
  file.directory:
    - user: mongodb
    - group: mongodb
    - makedirs: True

/opt/mongodb/conf:
  file.directory:
    - user: mongodb
    - group: mongodb
    - makedirs: True

/opt/mongodb/log:
  file.directory:
    - user: mongodb
    - group: mongodb
    - makedirs: True

/opt/mongodb/run:
  file.directory:
    - user: mongodb
    - group: mongodb
    - makedirs: True

#---------------- send necessary files ----------------

/opt/mongodb/conf/keyfile:
  file.managed:
    - source: salt://files/db/dev/dev_keyfile
    - user: mongodb
    - group: mongodb
    - mode: 600

send mongod shardsvr conf file:
  file.managed:
    - name: /opt/mongodb/conf/mongod_shardsvr.conf
    - source: salt://files/db/dev/mongod_shardsvr.conf
    - mode: 644
    - user: mongodb
    - group: mongodb

send mongod shardsvr systemd service file:
  file.managed:
    - name: /etc/systemd/system/mongod_shardsvr.service
    - source: salt://files/db/dev/mongod_shardsvr.service
    - mode: 644

send mongod configsvr conf file:
  file.managed:
    - name: /opt/mongodb/conf/mongod_configsvr.conf
    - source: salt://files/db/dev/mongod_configsvr.conf
    - mode: 644
    - user: mongodb
    - group: mongodb

send systemd configsvr service file:
  file.managed:
    - name: /etc/systemd/system/mongod_configsvr.service
    - source: salt://files/db/dev/mongod_configsvr.service
    - mode: 644

send mongos conf file:
  file.managed:
    - name: /opt/mongodb/conf/mongos.conf
    - source: salt://files/db/dev/mongos.conf
    - mode: 644
    - user: mongodb
    - group: mongodb

send systemd mongos service file:
  file.managed:
    - name: /etc/systemd/system/mongos.service
    - source: salt://files/db/dev/mongos.service
    - mode: 644  

#---------------- setup bin files ----------------

/opt/mongodb/:
  archive.extracted:
    - source: salt://files/db/percona-server-mongodb-3.4.10-2.10-xenial-x86_64.tar.gz
    - user: mongodb
    - group: mongodb

/opt/mongodb/server:
  file.symlink:
    - target: /opt/mongodb/percona-server-mongodb-3.4.10-2.10
    - user: mongodb
    - group: mongodb

/opt/mongodb/bin:
  file.symlink:
    - target: /opt/mongodb/server/bin
    - user: mongodb
    - group: mongodb

numactl:
  pkg.installed

#---------------- enable log rotate ----------------

send log rotate config file:
 file.managed:
  - name: /etc/logrotate.d/mongo
  - source: salt://files/db/dev/logrotate_mongo
