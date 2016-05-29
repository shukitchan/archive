Setting up ATS on EC2
=====================

There is no rpm provided. So we have to build our own software from the source code. On AWS console, I create a new
instance. I pick the Basic 64-bit Amazon Linux AMI and use Micro Instance (the free-tier!). Then we ssh login to the
instance and run the following commands –

```
sudo yum -y install autoconf automake libtool gcc-c++ glibc-devel openssl-devel tcl-devel expat-devel pcre libcap-devel
pcre-devel make
wget http://mirror.uoregon.edu/apache//trafficserver/trafficserver-3.0.2.tar.bz2
tar xvf trafficserver-3.0.2.tar.bz2
cd trafficserver-3.0.2
./configure
make
sudo make install
```

And that’s it! You might have to check out this page to determine which URL to use to wget the bz2 file. Also, please
note that this is for ATS 3.0.2. So you might have to change a little bit for the above commands for other version.

But we are not done yet. When ATS starts, it tries to figure out what Linux distribution it is installed on. On Amazon
EC2 with Amazon Linux, we need to give it a little help by making some small changes to the startup file (In other
version, it is not guaranteed to work so you need to look at the shell script of /usr/local/bin/trafficserver, figure
out where DISTRIB_ID is set and insert the line accordingly)

```
sudo sed -i '44 iDISTRIB_ID="fedora"' /usr/local/bin/trafficserver
```

By default, the server acts as a reverse proxy and start on port 8080. The cache is also enabled. So we only need to
make changes to the remap rules. We will also need to install HTTP server and serve some php scripts for basic testing.
Check out the commands below.

```
sudo yum -y install httpd
sudo yum -y install php
sudo mkdir /etc/ats-playground
cd /etc/ats-playground
sudo git clone git://github.com/shukitchan/edge-ats-playground.git
sudo mv /usr/local/etc/trafficserver/remap.config /usr/local/etc/trafficserver/remap.config.old
sudo cp /etc/ats-playground/edge-ats-playground/remap.config /usr/local/etc/trafficserver/remap.config
sudo ln -s /etc/ats-playground/edge-ats-playground/test0.php /var/www/html/test0.php
sudo ln -s /etc/ats-playground/edge-ats-playground/test1.php /var/www/html/test1.php
sudo /usr/sbin/apachectl -k start
sudo /usr/local/bin/trafficserver restart
```

There are two test php scripts included. The output for one is cacheable while the other is not. Try them out.

```
curl -v 'http://localhost:8080/test0.php'
curl -v 'http://localhost:8080/test1.php'
```

The config is also listing 3 Yahoo! sites as backend. You can access them with the following

```
curl -v 'http://localhost:8080/yahoo/'
curl -v 'http://localhost:8080/yahoosports/'
curl -v 'http://localhost:8080/yahoonews/'
```
