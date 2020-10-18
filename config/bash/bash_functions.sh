backup () {
	cd ~/github/tos-repo
	git add .
	git commit -m "backup"
	git push t master

	cd ~/github/programming-repo
	git add .
	git commit -m "backup"
	git push t master
}
