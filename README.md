upto
====
	
Bash function that allows to go up to a certain directory.

Stop counting how many levels you have to go up in a folder tree and just type where you want to go! No more `cd ../../../..`.

Usage example
-------

Current dir `/home/username/myfolder/myproject/mysubproject/function1/subfunction2/`

If you want to go to `/home/username/myfolder/myproject` you just type `upto myproject`

upto will go to the highest folder matched, in the previous example, if you write `upto my` you will move to `/home/username/myfolder`

Configuration
-------------

Just add `upto.sh` to your `/etc/profile.d/` folder.
