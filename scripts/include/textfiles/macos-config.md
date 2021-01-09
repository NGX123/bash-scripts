## Settings
* General
  * Appearance`(Dark)`
  * Accent color`(Blue)`
* Desktop & Screen Saver -> Screen Saver -> Start after`(Never)`
* Dock
  * Magnification`(ON)`(In the Middle)
  * Minimize windows using`(Scale effect)`
  * Show recent applications in Dock`(OFF)`
* Mission Control -> Automatically...on most recent use`(OFF)`
* Spotlight
  * Contacts`(OFF)`
  * Documents`(OFF)`
  * Events and Reminders`(OFF)`
  * Folders`(OFF)`
  * Fonts`(OFF)`
  * Images`(OFF)`
  * Mail and Messages`(OFF)`
  * Movies`(OFF)`
  * Music`(OFF)`
  * PDF`(OFF)`
  * Presentations`(OFF)`
  * Spreadsheets`(OFF)`
* Notifications`(Configure)`
* Accessibility -> Display -> Reduce Transparency`(ON)`, Reduce Motion`(ON, if laggy animations)`
* Screen Time -> Options -> Screen Time`(OFF)`
* Security -> Require password`(immediately)`
* Keyboard -> Shortcuts
  * Launchpad & Dock -> Show Launchpad`(Option + A)`
  * Mission Control
    * Switch to desktop $n`(Option + $n)`
    * Move left a workspace`(Option + <-)`, Move right a workspace`(Option + ->)`
    * Mission Control`(Option + Esc)`
  * Input Sources -> Select next source in input menu`(Option + Space)`
* Trackpad -> Seconary click`(Click in bottom right corner)`
* Display
  * Automatically adjust brightness`(OFF)`
  * True Tone`(OFF)`
* Energy Saver -> Turn off display after`(5 min)`


## Finder
* Preferences -> New Finder windows show`(user)`
* Customize toolbar`(Remove unneeded)`


## Fixes
* "xcode-select --install" - Can't install the software because it is not currently available from the Software Update server
  1. Sign in into app store if not signed in, Reboot, Retry "xcode-select --install"
  2. If signed in already, Sign out, Reboot, Sign in, Retry "xcode-select --install"
    * If still does not work try installing xcode from app store, Retry "xcode-select --install"
      * If the installation takes too long
        1. [Download Xcode](developer.apple.com/download/more)
        2. Doube click on *.xip in finder to extract the xcode
        3. Drag the extracted xcode app into Applications folder
        4. `(optional)`xcode-select --switch /Applications/Xcode*

* VirtualBox window is very small on retina
  1. VBox -> Choose VM -> Settings -> Display -> Graphics Controller`(VBoxSVGA)`