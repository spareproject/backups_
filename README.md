# backups_

tempted to dump catalyst and steam on bloat raged at cs:go and delted it all time to get some shit done i suppose
then attempt a remake at minimal boot stick with internal storage rootfs that can boot in pretty much anything but ive only really gave any cares about nspawn lately

but basically...
usb stick
/dev/sd[a-z]1 - ext4 formatted partition minimum /{gnupg,trigger}
/dev/sd[a-z]2 - /dev/random disk destroyer partition 

started off running as root... was pretty easy still trying to figure out a decent implementation for none root but it works to actually crypt/decrypt for 60 sec period of time
dumped a conky variable so it atleast has some feedback
the entire thing prbably sounds a little crazy i have no idea how stable a usb stick is to randomly dump 100 chars from an unformatted partition so definitly
making atleast 3 identical sticks (managing imported public keys /shrug) and doing an uptime test first before dumping anything of value into a rawfs

but the basic idea being controlled uptime of the entire gnupg directory worse case it gets left and either gpg-agent gets scraped or cp -ar and bruteforce
beats everything i have so far because its got the maximum allowed input password regardless and isnt directly on the system
if someone has access then your pretty fucked either way 
doing a random dd pull from a 6.7G partition of random data with a 100 chars...
^ its never going to be plugged in long enough for someone to dump the entire thing in theory and its still small enough to eat
and bar it literally been a single straight line string
<insert_code_here> 
any pin range + algorithm to scramble random block sizes that make the overall string together forwards backwards read one way hits a map reads backwards triggers etc insert imagination here
ultimate goal to require an entire data dump + random pin whatever length entry bruteforce as in no full dump no bruteforce (well partial) 

but either way these notes are probably about as clean as that entire directory is haha will fix it at some point but sleep

grsec still hates systemd-networkd random brctl addbr lulz brctl delbr lulz then restart and apperent magic wizardy occurs grsec decides the thing it was blocking is now safe to run... 
only way i could network bridges to boot everything else seems pretty fine havent tested remote desktop yet because nspawns still limping through need better internal storage management hence this 
/mnt/
  luks
  rawfs
  mount
  storage
then might be able to boot random server configs back on lan to play 
