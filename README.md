# terraria
Docker container for Terraria Server

This is currently running with Ubuntu 16.04 and Terraris 1.3.4.4.  This assumes you will mound a volume containing a config file (called config.txt) and also your world name.  You should specify your world path and filename in the config file.

docker run -it --name="terraria" -v E:\terraria:/world -p 7777:7777 inxaos/terraria
