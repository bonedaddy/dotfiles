# dotfiles

My personal dotfiles, and bare minimum scripts, docker compose, and other miscellaneous things I use across all my devices. 


# bigdeenus

`bigdeenus` is the ultimate DNS system to run in your local network. It provides extremely high levels of privacy and security compared the DNS setup you probably have right now. It uses CoreDNS with the ENS plugin, Stubby, and PiHole. I currently run this setup manually with binaries, however I'm in the process of dockerizing it. It's benefits can be summarized as:

* DNSSEC
* EDNS enhancements
* DNS over TLS [DoT]
* DNS over HTTP [DoH] (WIP)
* Network level adblocking
* ENS lookup capabilities

## overview

CoreDNS is used to provide the "nameserver" capabilities, with added caching and EDNS0 buffer size support, as well as support for resolving ENS names. It forwards all queries to Stubby, which provides the DNSSEC, and DoT functionality, as well as handling of all communication with upstream servers. Unfortunately CoreDNS caching appears to be broken, so if that's import for you I would recommend using dnsmasq instead of CoreDNS, but you end up losing the ENS lookup capabilities. If you want to use dnsmasq you can use the following config:

```
domain-needed
bogus-priv
no-resolv
proxy-dnssec
neg-ttl=1800 
cache-size=10000
dns-forward-max=300
server=::1#53000
server=127.0.0.1#53000
listen-address=::1,127.0.0.1
```

## docker setup

Right now the docker setup works for CoreDNS + Stubby without any PiHole integration. Currently I'm in the process of enabling PiHole for the docker compose file.