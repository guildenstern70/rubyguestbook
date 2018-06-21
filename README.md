# Ruby Guestbook
Applicazione di esempio contenuta nel libro **Ruby e Rails** di _Alessio Saltarin_

### Start MySQL

Install MySQL and then run it as a demon, ie on MacOSX:

    cd /usr/local/mysql/support-files/
    sudo ./mysql.server start 

### Create DB

Execute

    rake db:create
    rake db:migrate
    
### Build & Run

Execute

    rails server
    
    