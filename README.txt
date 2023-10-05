Here's how to run the script:

1. Download the install_packages.sh file

2. Run this command in terminal:

bash /Users/$USER/Downloads/install_packages.sh


2a. If running from a flash drive, copy the pathname to the script instead.
	
	1. Right click the script icon (install_packages.sh)
	2. Hold the option key
	3. Click "copy as pathname"

	4. bash (paste here)



3. Done



The script should:
	Check if Homebrew is installed, install it if not
	Check if the desired packages are installed, install them if not

If you want additional packages, create a text file with the file extension ".package" with a list of the desired packages. OR Add to the list of packages within the script.
They need to match the listed names in Homebrew's repository so make sure to search for the package first at: https://brew.sh