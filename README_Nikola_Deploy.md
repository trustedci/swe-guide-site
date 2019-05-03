# swe-guide-site
## READ ME: How to Deploy the SWE Guide Website. 

This guide is written for deploying a Nikola Package using Linux.  Before you can deploy using the Conf.py Script you must have installed :
* Python 3+	
* Nikola 8.+ 	
* SSHFS
* Your SSH key added to the Gandi hosting keys list for the SWE.trustedci.org instance.

### 1: Python
Make sure Python3.+ is installed on your machine.

### 2: Nikola 
Instructions on installing Nikola can be found at https://getnikola.com/getting-started.html .
>*Do not use Snap in Ubuntu to install Nikola, the version of Nikola currently in Snap is outdated and cannot be effectively upgraded To version 8+ *<

If you are running Ubuntu and are having trouble with the Nikola install as outlined on getnikola.com, a better tutorial for installing Nikola  in Ubuntu is located here:  
https://flexion.org/posts/2015-11-installing-nikola-on-ubuntu/

> Note:  When running these commands, any that call python make sure you are replacing the version number in the script with the version number you are running. <

> Example, Where the script in the tutorial calls for python3.4, change it to the version of Python installed on your PC.  For example: change 3.4 to   3.7.  If 3.7 is your current version. 
The install with fail if this is not done.<

### 3 SSHFS
Install SSHFS, this is required to run the deploy script. 
 
### 4 Authorization
Authorization must be established to allow the deploy script to run.
 You will need to generate a public SSH Key and request it be added to the security keys for the gandi instance. The point of contacts to add these keys are : 
conleym@iu.edu and amitts@iu.edu .

________________________________________________________________________

## Respiratory and Branch Structure 

The structure of the SWEguide Git Project and its branches. The current ready to deploy Nikola packages are located in the Master Branch. The Development Branch is the working directory. Files in the Development  Branch are in testing and are being actively updated.  
________________________________________________________________________

## Steps to deploy the site.

Step 1:
Create a local empty directory to place the Master branch.

Step 2:
Clone the Master branch to your local machine.  
`git clone git@github.com:trustedci/swe-guide-site.git`

Step 3: 
Open your virtual environment that Nikola was installed into. 

Step 4:
 `cd ` into the folder containing the Nikola website conf.py file.

Step 5:
Run the command `nikola build` this will build the website locally on your PC and create the ‘ htdocs’ folder inside your working directory.

Step 6 :
Run `nikola serve` and open the site locally to verify that looks like what you are expecting before you initiate deploy.

Step 7 :
Run `nikola deploy`. This command uploads the ‘ htdoc’ folder to the web server.  

Step 8 :
Verify the upload by navigating to http://sweguide.trustedci.org/ 

___________________________________________________

## Break down of the deploy script :

The following is a breakdown of how the deploy script functions for troubleshooting purposes. 
Each command has the verbose tag, an can be monitored as the site deploys.

 - Creates an empty folder on the local machine to be used as a  mount point.
       ` "mkdir -v ~/sweguide/SimpleHosting/", `

 - mounts the new folder to the remote server using SSHFS, this will fail if your key is not set up correctly. 
       `  "sshfs 1914798@sftp.sd3.gpaas.net:/ ~/sweguide/SimpleHosting/",`
        
  - Waits 5 seconds, pauses were added to allow time for remote connections.
        ` "sleep 5",`	
         
- this step is currently commented out in the conf.py file. Uncomment 'rm' step if the folder isn't copying correctly, this will wipe the remote dir, and then copy new files. 
         
	` #"rm -rfv  ~/sweguide/SimpleHosting/vhosts/sweguide.trustedci.org/htdocs",  
          # Waits 5 seconds   
          #"sleep 5", `      

- the following step copies files  to the remote server .
       ` "cp -rfv htdocs ~/sweguide/SimpleHosting/vhosts/sweguide.trustedci.org/", `
   
- Waits 5 seconds  to ensure transfers had time to complete      
`"sleep 5", ` 
	
- post cleanup unmounts the remote directory  and deletes the emply folder from your local machine. 
        ` "fusermount -zu  ~/sweguide/SimpleHosting/",
         "rm -rfv ~/sweguide/SimpleHosting/ ," `
____________________________________________________

