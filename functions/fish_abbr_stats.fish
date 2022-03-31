function fish_abbr_stats \
    --description 'Display usage stats around abbreviations used'

    for a in (abbr)
        set -l abbr (string replace -r '(.+)\s+--\s+(.+)' '$2' $a)
        set -l abbr_name (string replace -r '(\w+)(\s+.*)' '$1' $abbr)
        set -l abbr_cmd (string match -r '^[^\(]+' (string trim --chars=\' (string match -r '\'[^\']+\'' $abbr)))

        set -l abbr_count (history | grep -e "^$abbr_cmd" | count)
        echo "$abbr_name used $abbr_count times"
    end

end