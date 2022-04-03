for app in (flatpak list --app --columns=application,description)
	set app_arr (string split \t $app)

	set app $app_arr[1]
	set app_desc $app_arr[2]
	set app_name (string lower (string split . $app_arr[1])[3])
	set app_cmd "flatpak run $app_arr[1]"

	if not type -q $app_name
		eval "function $app_name --description \"[flatpak] $app_desc\" --wraps \"$app_cmd\"; $app_cmd; end;"
	end

end
