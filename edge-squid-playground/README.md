Setting up Squid on EC2
=======================

To do that with cloud-init on AWS, I create a new instance. I pick the Basic 64-bit Amazon Linux AMI and use Micro Instance
(the free-tier!). And then I use the following as my User Data.

```
#!/bin/bash -ex
yum -y install httpd
yum -y install php
yum -y install squid
yum -y install git-core
cd /etc/
mkdir /etc/squid-playground
cd /etc/squid-playground
git clone git://github.com/shukitchan/edge-squid-playground.git
mv /etc/squid/squid.conf /etc/squid/squid.conf.old
cp /etc/squid-playground/edge-squid-playground/squid.conf /etc/squid/squid.conf
ln -s /etc/squid-playground/edge-squid-playground/test0.php /var/www/html/test0.php
ln -s /etc/squid-playground/edge-squid-playground/test1.php /var/www/html/test1.php
/usr/sbin/apachectl -k start
/usr/sbin/squid -z
/etc/init.d/squid start
```

And that’s it. This will setup an apache server on port 80 and Squid on port 8080 with the local apache as origin
server. You can see the execution of the script in /var/log/cloud-init

There are two test php scripts included. The output for one is cacheable while the other is not. Try them out.

```
curl -v 'http://localhost:8080/test0.php'
curl -v 'http://localhost:8080/test1.php'
```
