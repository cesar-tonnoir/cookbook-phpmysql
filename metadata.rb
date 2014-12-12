name             'phpmysql'
maintainer       'Cesar Tonnoit'
maintainer_email 'it@maestrano.com.com'
license          'all_rights'
description      'Installs/Configures cookbook-phpmysql'
long_description 'Installs/Configures cookbook-phpmysql'
version          '0.1.0'

recipe "phpmysql", "Installs PHP, NGINX, & MySQL client on the container"

depends "nginx"
depends "database"
depends "mysql", "~> 5.5.0"
depends "tar"
depends "php"
depends "php-fpm"

%w{ debian ubuntu windows centos redhat scientific oracle }.each do |os|
  supports os
end