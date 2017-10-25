ClamAV scripts to allow On Access scanning for OSX in a multi-user environment.

Installation of software is mostly through HomeBrew: https://brew.sh/

brew install clamav
brew install fswatch

In clamd.conf:
Comment out Example, and LocalSocket.
Enable TCPSocket and TCPAddr, so that users can access the clam daemon from their account.

Copy OnAccessScan.sh and notify.sh to /usr/local/bin/
Copy org.brew.clamd.plist and org.brew.freshclam.plist to /System/Library/LaunchDaemons/
Enable the services through launchctl:
sudo launchctl load /System/Library/LaunchDaemons/org.brew.clamd.plist
…

Copy org.brew.clamdscan.plist to the User’s plist directory ~/Library/LaunchAgents/
Enable that for the User: launchctl load ~/Library/LaunchAgents/org.brew.clamdscan.plist

Installation Complete.

The OnAccessScan.sh, checks to make sure that the User has a Quarantine directory and if not creates one, than runs fswatch on their home directory with clamdscan to get a live virus scan.

The notify script, appends the filelist.txt file in the user’s directory with the original location of the suspected file, and displays an Apple notification to the user.


All credit goes to the ClamAV team, and Enrico Maria Crisostomo.
http://www.clamav.net/
https://github.com/emcrisostomo
