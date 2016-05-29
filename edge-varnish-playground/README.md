Setting up Varnish on EC2
=========================

To do that with cloud-init on AWS, I create a new instance. I pick the Basic 64-bit Amazon Linux AMI and use Micro Instance
(the free-tier!). And then I use the following as my User Data.

```
#!/bin/bash -ex
yum -y install httpd
yum -y install php
rpm --nosignature -i http://repo.varnish-cache.org/redhat/varnish-3.0/el5/noarch/varnish-release-3.0-1.noarch.rpm
yum -y install varnish
yum -y install gcc
yum -y install git-core
cd /etc/
mkdir /etc/varnish-playground
cd /etc/varnish-playground
git clone git://github.com/shukitchan/edge-varnish-playground.git
ln -s /etc/varnish-playground/edge-varnish-playground/test.vcl /etc/varnish/test.vcl
ln -s /etc/varnish-playground/edge-varnish-playground/test0.php /var/www/html/test0.php
ln -s /etc/varnish-playground/edge-varnish-playground/test1.php /var/www/html/test1.php
/usr/sbin/apachectl -k start
/usr/sbin/varnishd -s malloc,256M -f /etc/varnish/test.vcl -a 0.0.0.0:8080
```

And that’s all. This will setup an apache server on port 80 and Varnish on port 8080 with the local apache as one of the
backends. You can see the execution of the script in /var/log/cloud-init

There are two test php scripts included. The output for one is cacheable while the other is not. Try them out.

```
curl -v 'http://localhost:8080/test0.php'
curl -v 'http://localhost:8080/test1.php'
```

The sample VCL is also listing 3 Yahoo! sites as backend. You can access them with the following

```
curl -v 'http://localhost:8080/yahoo/'
curl -v 'http://localhost:8080/yahoosports/'
curl -v 'http://localhost:8080/yahoonews/'
```
