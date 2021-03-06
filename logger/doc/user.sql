# create the following three mysql users:

# used by syslog-ng for inserting new data, referenced in /etc/syslog-ng/conf.d/08newlogsql.conf
GRANT INSERT,SELECT,UPDATE ON lggr.* TO logger@localhost IDENTIFIED BY 'ZlY7VJAnuzK6tGlO';

# used by the web gui for normal viewing, referenced in inc/config_class.php
GRANT SELECT ON lggr.* TO logviewer@localhost IDENTIFIED BY 'dR8v5XOfUVdvz0b';

# used by clean up cron job and for archiving, referenced in inc/adminconfig_class.php
GRANT SELECT,UPDATE,DELETE ON lggr.* TO loggeradmin@localhost IDENTIFIED BY '039A7CyyTqruPrXseL';
GRANT SELECT,INSERT  ON TABLE `lggr`.`servers` TO 'loggeradmin'@'localhost';

# activate changes
FLUSH PRIVILEGES;
