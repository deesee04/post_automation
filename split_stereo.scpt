on adding folder items to this_folder after receiving added_items
	
	set outputfolder to "Split_Stereo_Output"
	set outputpath to (path to desktop folder) as string
	set f_outputpath to (outputpath & outputfolder) as string
	set full_outputpath to (quoted form of POSIX path of f_outputpath)
	
	tell application "Finder"
		if (exists folder (outputpath & outputfolder as string)) = false then
			make new folder at desktop with properties {name:outputfolder}
		end if
	end tell
	
	repeat with i in added_items
		
		set {name:Nm} to (info for i)
		
		tell (info for i) to set {Nm, Ex} to {name, name extension}
		set bname to text 1 thru ((get offset of "." & Ex in Nm) - 1) of Nm
		set basename to quoted form of bname
		
		
		do shell script "/usr/local/bin/ffmpeg -i " & (quoted form of POSIX path of i) & " -map_channel 0.0.0 " & full_outputpath & "/" & basename & ".L.wav" & " -map_channel 0.0.1 " & full_outputpath & "/" & basename & ".R.wav"
		
	end repeat
end adding folder items to
