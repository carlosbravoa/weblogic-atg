# Weblogic local install

## Scope
This cookbook installs Oracle Weblogic Server 12.1.3 from a local repo.
Oracle Java 1.8.0_92 is also installed as a required dependency.

## Requirements
* Chef 12 or higher
* Network accessible artifact repository
* Centos/Redhat 6+

## Usage

1. Update chef-client on the node (chefdk currently installs 11.X and we need 12.X).
   [You can use the script provided or the chef recipe or just manually]

2. Create a repo with the following structure:


>     /chef-client/
>        chef-12.11.18-1.el6.x86_64.rpm
>     /oracle/
>        atg/
>           11.2/
>               OCPlatform11_2.bin
>        java/
>			1.8.0_92/
>				jdk-8u92-linux-x64.rpm
>		weblogic-server/
>			12.1.3/
>				fmw_12.1.3.0.0_wls.jar


3. Update recipes attributes with the network address of your local repo

4. Bootstrap your node with the recipe['weblogic']

