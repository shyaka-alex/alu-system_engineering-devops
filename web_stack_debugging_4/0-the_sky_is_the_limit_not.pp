# Raises the open file limit of Nginx so it can handle many concurrent requests
exec { 'fix--for-nginx':
  command => 'sed -i s/15/4096/ /etc/default/nginx',
  path    => '/usr/local/bin/:/bin/',
}

# Restarts Nginx to apply the new limit
exec { 'nginx-restart':
  command => '/etc/init.d/nginx restart',
  require => Exec['fix--for-nginx'],
}
