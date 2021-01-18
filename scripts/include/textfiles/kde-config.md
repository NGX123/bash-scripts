## Desktop look
* Go to desktop
* Right click on every panel -> `(Bin icon)`Remove panel
* Right click on desktop -> Add Panel`(Empty Panel)`
* Right click on panel -> Add widgets in the following order: `Application Menu`, `Icons only task manager`, `System tray`, `Digital clock`
* Right click on panel -> Edit Panel
	* Height`(Decrease until icons deform)`
	* Screen Edge`(Upper)`
* Right click on Application Launcher on Panel -> Configure Application Dashboard/menu
	* Show categories:
		* Recent application`(OFF)`
		* Recent documents`(OFF)`
	* Search -> Expand search to bookmarks, files and emails`(OFF)`
	* Keyboard Shortcuts`(Meta + Any Key)`
* Right click on System tray -> Configure System tray -> Unneeded entries`(OFF)`
* Right click on Icons only Task Manager -> Configure Icons only... -> Behavior -> Cycle through tasks with mouse wheel`(OFF)`
* Right click on desktop
	* Configure Desktop -> Wallpaper`(Set wallpaper)`
	* Mouse Actions -> Vertical-Scroll(Switch Desktop) -> `(- Icon)`Remove

## Configure system(System settings)
* Appearance -> Application Style -> Window Decorations -> Titlebar Buttons -> Remove: `On all desktops`, `Context help`

* Workspace
	* Workspace Behavior
		* General Behavior -> Animation Speed`(Instant - No animations; In the middle - Normal animations)`
		* Desktop Effects
			* Appearance -> (Background contrast, Fading Popups, Login, Logout, Maximize, Squash)`(ON)`
			* Focus - > Dialog Parent`(ON)`
			* Virtual Desktop Switching Animations`(Slide)`
			* Window Management -> Dektop Grid`(ON)`
			* Window Open/Close Animation`(Scale. or Glide)`
			* Others`(OFF, in most cases)`
		* Screen Edges -> Click on each -> Set action`(No action)`
		* Screen Locking
			* Appearance`(Change wallpaper)`
			* Lock screen`(2 min)`
			* Allow unlocking without password for`(Immediatly)`
	* Window Management -> Task Switcher -> Main -> Visulatization`(Large Icons)`
	* Shortcuts
		* `(+ Icon)`Add -> KSysGuard`(Ctrl + Shift + Esc)`
		* `(+ Icon)`Add -> Terminator`(Ctrl + Alt + T)`
		* `(+ Icon)`Add -> Dolphin`(Super + E)`
		* `(- Icon)`Remove -> Emoji
		* Kwin
			* Switch to Desktop x`(Super + x)`
			* Windows to Desktop x`(Super + Shift + x)`
			* Show Desktop Grid`(Super + Esc)`
			* Minimize Windows`(Super + H)`
			* Maximize Window`(Super + Up)`
			* Switch to workspace above/below`(Super + Alt + ->\<)`
		* Hardware -> Input Devices -> Keyboard -> Layout -> Main shortcut`(Set - Super + Space)`
	* Startup and Shutdown
		* Splash Screen`(None)`
		* Login Screen -> Breeze -> Background`(Set)`
		* Desktop Session -> On Login`(Start with an empty session)`
	* Search -> File Search -> Enable File Search`(OFF)`

+ Personalization
	+ Applications -> Default`(Set)`, Diagnostics`(OFF)`

+ Hardware
	+ Power Management
		On battery:(If problems occur like screen not turning off - dim screen`(OFF)`, screen energy saving`(2 min)`
		+ Keyboard backlight`(OFF)`
		+ Dim screen`(2 min)`
		+ Screen Energy Saving`(3 min)`
		+ Suspend Session`(Sleep after 10 min)`
		+ Button events handling`(When laptop lid close even when exeternal monitor connected - sleep)`

		On AC
		+ Dim screen`(5 min)`
		+ Screen Energy Saving`(10 min)`
		+ Suspend session`(Sleep after 20 min)`
		+ Button events handling`(When laptop lid closed - sleep)`

## Extra
* System Appearance(System Settings -> Appearance)
	* Breeze Dark - Global Theme`(Breeze Dark)`, Plasma Style`(Breeze Dark)`, Application Style`(Breeze)`, Application Style-Window Decorations`(Breeze)`, Application-Style-GTK2/3`(Breeze Dark)`, Colors`(Breeze Dark)`, Icons`(Breeze Dark)`
	* ChromeOS - Global Theme`(ChromeOS by vinceliuice, select the dark version; store.kde.org/p/1354062)`, Plasma Style`(ChromeOS)`, Applications Style`(Breeze)`, Application Style-Window Decorations`(ChromeOS-dark)`, Application Style-GTK2/3`(Orchis Gtk by vinceliuice, select the dark version; store.kde.org/p/1357889)`, Colors`(ChromeOSDark)`, Icons`(Tela by vinceliuice, select dark; store.kde.org/p/1279924)`

	* Icons - Tela`(by vinceliuice, download the black version and select the black-dark in settings; store.kde.org/p/1279924)`
	* Themes - Dark Breeze, Nordic, Adapta

* System Appearance leftover can be removed from these directories(Themes that can't be uninstalled)
	* Global themes - `~/.local/share/plasma/look-and-feel/`
	* Themes - `~/.local/share/plasma/desktoptheme/`
	* Windows Decorations - `~/.local/share/aurorae/themes/`
	* Color Schemes - `~/.kde/share/apps/color-schemes/`
	* Icons - `~/.local/share/icons/`

* Remove bloatware
	* `(terminal)`sudo apt/dnf remove skanlite okular vlc kate kcalc
	* `(terminal, optional)`sudo apt/dnf remove kdeconnect
	* `(terminal, optional)`sudo apt/dnf remove kvantum
  	* `(terminal)`sudo apt/dnf autoremove

* Other
	* Config videos
		* https://www.youtube.com/watch?v=Vi65-wT3o20
		* https://www.youtube.com/watch?v=34F_038G5pU&t
	* To bind a shortcut to Meta(Windows) key, just bind it to Meta+1 which has the same effect(will work with both meta and meta+1)
