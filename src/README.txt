VirtStat
========

VirtStat is a shell script program that gives info from KVM hosts, allows copy files/directory to all other hosts and 
permit to execute remote commands.


USAGE
=====

As a command: 

	$ VirStat [mail|screen|copy]

	mail) This function sends a mail with the lists of VM's in all virtualization hosts. USAGE: VirtStat mail
	
	screen) Like mail but prints in screen the information. USAGE: VirStat screen

	copy) Copy a file or directory in the same path on all other virtualization hosts. USAGE: VirtStat copy PATH DES-PATH

	exec) Execute a command in head host and remote hosts. USAGE: VirtStat exec "command". EX: VirtStat exec "ls /home"


NOTES
=====

1.- For send mails, you have to configure /etc/VirtStat/mail with one email per line.

2.- If you have more than one virtualization host, you've to put them in /etc/VirtStat/servers, one per line.

3.- For execute a remote command, put it in " ".

4.- It's hardly recommend permit SSH root login or sudoers without pass. SEE: ssh-copy-id

