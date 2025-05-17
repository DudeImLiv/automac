on run {input, parameters}
	repeat with i in input
		set selectedFolder to POSIX path of (i as alias)
		do shell script "/usr/local/bin/cursor " & quoted form of selectedFolder
	end repeat
	return input
end run