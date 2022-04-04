set -l additional_paths \
	/opt/local/bin \
	/opt/local/sbin

for path in $additional_paths
	if test -d $path
		fish_add_path --path $path
	end
end

abbr -ag pi		sudo port install
abbr -ag pl		port list
abbr -ag ps		port search
abbr -ag psu		sudo port selfupdate
abbr -ag puo		sudo port upgrade outdated
