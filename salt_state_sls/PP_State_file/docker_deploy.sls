add_docker_repo:
  pkgrepo.managed:
    - name: deb [arch=amd64] https://download.docker.com/linux/ubuntu {{ grains ['oscodename'] }} stable
    - file: /etc/apt/sources.list.d/docker-{{ grains ['oscodename'] }}.list
    - key_url: https://download.docker.com/linux/ubuntu/gpg
    - refresh_db: True
    - require_in:
        - pkg: docker-ce

docker-ce:
  pkg.installed:
    - refresh: True
    - version: 17.03.2~ce-0~ubuntu-xenial

install_docker_compose:
  cmd.run:
    - name: curl -L https://github.com/docker/compose/releases/download/1.18.0/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose

apply_permission:
  cmd.run:
    - name: chmod +x /usr/local/bin/docker-compose