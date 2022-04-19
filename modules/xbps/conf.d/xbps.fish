abbr -ag xi   	sudo xbps-install
abbr -ag xq   	xbps-query -Rs
abbr -ag xr	sudo xbps-remove
abbr -ag xro	sudo xbps-remove -o
abbr -ag xsb  	$XBPS_SRC_ROOT/xbps-src pkg
abbr -ag xsc	$XBPS_SRC_ROOT/xbps-src show-sys-updates
abbr -ag xsi  	sudo xbps-install --repository $XBPS_SRC_ROOT/hostdir/sources
abbr -ag xsr	pushd $DBPS_SRC_ROOT && git pull && popd
abbr -ag xsq  	ls $XBPS_SRC_ROOT/srcpkgs/ \| grep -i -e
abbr -ag xu   	sudo xbps-install -Syu
