#!/bin/sh
if [ "$1" = 'squid-deb-proxy' ]; then
  chmod a+w /proc/self/fd/1
  cache_dir=`/usr/share/squid-deb-proxy/find-cache-dir.sh cache_dir /etc/squid-deb-proxy/squid-deb-proxy.conf`
  /usr/share/squid-deb-proxy/init-common.sh
  umask 027
  ulimit -n 65535
  su  -s "/bin/sh" -c "cd $cache_dir && squid -N -f /etc/squid-deb-proxy/squid-deb-proxy.conf" squid
else
  exec "$@"
fi
