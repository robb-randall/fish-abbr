function fish_abbr_loader                           \
    --description 'Loads a file of abbreviations'   \
    --argument-names config_file

    # Ensure the config_file passed exists
    if not test -e $config_file
        echo $config_file is not a file
        return 1
    end

    # Clear abbreviations
    # TODO: Add switch to enable erasing existing abbreviations
    # TODO: Parse the config file to ensure valid before clearing anything
    for a in (abbr --list)
        # TODO: Add debuggin/quiet
        #echo "Erasing '$a'"
        abbr --erase $a
    end

    set -f regex_abbr_split '^([^\s]+)\s+(.+)'
    set -f regex_cmd_split '^((sudo|doas)\s+)?([^\s]+)(\s.*)'

    # Read the config file line-by-line
    cat $config_file | while read -l line

        # Remove any non-abbreviation lines
        if not string match -qr '^\w' $line
            #echo "Skipping line: $line"
            continue
        end

        # Split the abbr and the command
        # - $line         = "ll ls -la"
        # - $abbr_name    = "ll"     -- Abbreviation
        # - $abbr_cmd     = "ls -la" -- Command to run
        # - $abbr_test    = "ls"     -- Core command to test if exists
        set -l abbr_name (string replace -r $regex_abbr_split '$1' $line)
        set -l abbr_cmd  (string replace -r $regex_abbr_split '$2' $line)
        set -l abbr_test (string replace -r $regex_cmd_split  '$3' $abbr_cmd)

        # Test to ensure the command exists)
        # - Different OSes and Linux distors have varrying commands to manage
        # - the systems.  This is to check if the command exists before creating
        # - the abbrivation. This is so you only need to maintain one config for
        # - many computers/OSes.
        if not type -q $abbr_test
            #echo "skipping '$line' - '$abbr_test' command not found."
            continue
        end

        # TODO: Add ability to change abbr switches
        set -f abbr_eval "abbr -ag $abbr_name $abbr_cmd"
        eval $abbr_eval
        #echo "Created: $abbr_eval"

    end

end