## 2019-07-06
* UpCloud initial config
    - Promo code / review: https://joshtronic.com/2019/07/01/vps-showdown-digitalocean-lightsail-linode-upcloud-vultr/
    - IP addr: 152.44.37.26
* root login, set editor, add user, visudo
* install R
    - ref: https://cran.r-project.org/bin/linux/debian/#debian-stretch-stable
    - add repo: "deb http://ftp.osuosl.org/pub/cran/bin/linux/debian stretch-cran35/"
    - enable keychain: `sudo apt-get install dirmngr --install-recommends`
    - add key 
    - `time sudo apt install r-base-dev` (49s) 
* fetch admin
    - install git
    - fetch admin repo: git@github.com:helmingstay/admin.git
    - add symlinks...
    - vim: install pathogen, solarized
* Note: auto ssh-agent in zshrc breaks ssh agent forwarding...
* shiny server:
    - install: https://www.rstudio.com/products/shiny/download-server/
    - admin quickstart: https://docs.rstudio.com/shiny-server/#quick-start
    - restart: `sudo systemctl restart shiny-server`
    - install packages 'shiny' and 'rmarkdown' as root
    - drop root permissions?
* Add swap file:
    - ref: https://linuxize.com/post/how-to-add-swap-space-on-debian-9/
* Afraid.org: point here
