# What are WebRTC leaks?

* WebRTC implement STUN (Session Traversal Utilities for Nat), a protocol that allows to discover the public IP address. To disable it:

### Mozilla Firefox: 

Type "about:config” in the address bar. Scroll down to “media.peerconnection.enabled”, double click to set it to false.

### Google Chrome:

Install Google official extension WebRTC Network Limiter.

### Opera: 

Type "about:config" in the address bar or go to "Settings". Select "Show advanced settings" and click on "Privacy & security". At "WebRTC" mark select "Disable non-proxied UDP".
