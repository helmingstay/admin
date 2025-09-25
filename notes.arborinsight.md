## 2025-09-06
* carya ssh setup
    - new key
    - add arbor_gcp to .ssh/config
* initial login, clone ~/admin and arbor.insight repos
    - copy dotfiles
    - sudo chsh xian: /usr/bin/zsh
* R package install: dependencies
    - `sudo apt install libabsl-dev cmake libgdal-dev libudunits2-dev`

## 2025-09-25
* Debug agent forwarding
    - don't start agent on remote end 
    - Ref: https://stackoverflow.com/questions/49657768/using-ssh-agent-forwarding-to-clone-git-repo
* Add github veridist-xian permissions, keys to admin repo
* carya ssh setup
    - add arbor_docker (for docker-test)
* setup xian@docker-test
    - clone admin, ln -s dotfiles
    - `sudo chsh xian`
    - `chmod 750 ~xian` (share with accounts)
* setup accounts@docker-test
    - `sudo adduser accounts xian`
    - ln -s dotfiles (from ~xian)
    - `sudo chsh xian`
* install docker from apt
    - ref: https://docs.docker.com/engine/install/debian/
