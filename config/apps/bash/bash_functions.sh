backup_data () {
	current_date=$(date '+%d-%m-%Y')

	# Check presence of google drive folders
	if ls *gdrive* >> /dev/null
		then
			echo "GDrive Folders Found"
		else
			echo "GDrive Folders Not Found"
			exit
	fi

	# Tar(but not compress) google drive folders
	tar --verbose --create --file=gdrive_"$current_date".tar *gdrive*
	#zip -0 -r google-drive_"$current_date".zip *gdrive* # zip the direcotries recursively without compression

	# Clone the repositories
	git clone https://github.com/NGX123/tos tos-repo
	git clone https://github.com/NGX123/unix unix-repo
	git clone https://github.com/NGX123/programming programming-repo

	# Tar(but not compress) the repositories
	tar --verbose --create --file=github_"$current_date".tar *repo
	#zip -0 -r github_"$current_date".zip *repo

	# Remove the leftover
	rm -rf ./*gdrive* ./*repo
}
	
push_github () {
	cd ~/github/tos-repo
	git add .
	git commit -m "backup"
	git push t master

	cd ~/github/programming-repo
	git add .
	git commit -m "backup"
	git push t master
}
