# Home Lab

This is an overview of my home lab, which unfortunately is only partially setup right now due to space requirements.

* Media Server
  * RPi 4B running plexmediaserver, as well as transmission-daemon
* Wiki Server
  * RPi 4B running media wiki
  * Also runs `ghorg` on daily/weekly jobs to archive various github repositories
  * Also serves to provide SSHFS access to portable hard drive for backups of my laptop and computers
* PiHole Server
  * RPi 3B+ running pihole
* 2x RPi 3B+ for misc activities, usually used for running docker stuff
  * Also used as a testing server for running TemporalX on embedded devices

# Full Setup

* 2x rack servers running ESXi that I deploy the aforementioned software currently running on Raspberry Pi's into server environments
* 1x tower server running openmediavault which acts as a media server and generalized NAS
* 1x Raspberry Pi running RasPlex connected to a TV
* pfSense firewall using netgate hardware
