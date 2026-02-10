# kanata enthium

Simple enthium style layout for kanata with some glorious-engrammer style utility layers. Does not use the most up to date version of enthium, but a previous release candidate.

Also includes a systemd unit file to enable the layout automatically before login. `install-kanata.sh` will install kanata into `/usr/bin/`, import the systemd unit + config files, and automatically enable/start the service.

Scripts require linux (with systemd) + rust installed
