# terraria
Docker container for Terraria Server

This is currently running with Ubuntu 16.04 and Terraria 1.3.4.4.  This assumes you will mount a volume containing a config file (called config.txt) and also your world name.  You should specify your world path and filename in the config file.

Fstab entry:
//192.168.2.5/primarystorage/terraria /mnt/terraria cifs username=guest,password=,uid=1000,iocharset=utf8 0 0

docker run -dit --name="terraria" -v /mnt/terraria:/world -p 7777:7777 inxaos/terraria:latest

Sample service file is also in this repo.
