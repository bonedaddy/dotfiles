# Home Lab

This is an overview of my home lab, which unfortunately is only partially setup right now due to space requirements.


## Partial Setup

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

## Full Setup

The exact same as the partial setup, except everything is powered by 2x rack servers running ESXi instead of Raspberry Pi's with the addition of:
  
  * 1x tower server running openmediavault which acts as a nas server and openmedia vault server
  * 1x Raspberry Pi running RasPlex connected to the main tv
  * pfSense firewall using netgate hardware
