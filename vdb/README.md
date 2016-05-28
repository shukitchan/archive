Back in 1999, Dreamcast is a big deal. I still admired some of the advanced feature of that console, such as online gaming (with modem), voice chat, the funny/innovative Seaman game, 4 controller ports and the funny little VMUs.

VMU is the memory card for Dreamcast, a neat platform itself with 4-way d-pad, 2 buttons and 40×32 LCD. In 2002, I built this thing called VDB, which is a Java client that turns data into a VMU app. Data can be entered either through UI grid and then can be saved as text file. And it must be saved before hitting the “Output” menu option to generate VMU files(*.VMI & *.VMS), which you can put on server. Please note that the filename for the “Output” menu option must be upper
case, under 12 characters and ends with “.VMS”. Once the VMI and VMS files are on the server, you can access the VMI file through dreamcast online & the application will be downloaded to VMU.

![alt text](/vdb/vmdb.jpg?raw=true "screen shot")

To run the program, download the jar file, go to the containing directory and type “java -cp vmdb.jar vmdb.vmdb”. Of course you need Java installed on your machine in order to run it. Note: I used Java 1.6 and it worked perfectly.

Also, on the apache server, the .htaccess files will need 2 lines to support VMU files

```
addtype application/x-dreamcast-vms-info vmi
addtype application/x-dreamcast-vms vms
```

P.S. Here are some links to development resources for Dreamcast VMU

* [Deco VMU Guide](http://www.deco.franken.de/myfiles/myfiles.html)
* [Marcus VMU](http://mc.pp.se/dc/)
