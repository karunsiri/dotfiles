## Do these after setting up openSUSE

### Update stuff

    sudo zypper refresh
    sudo zypper update

In case of running rolling distro

    sudo zypper dist-upgrade

## Create fs snapshot

openSUSE use `btrfs` filesystem, so we should make use of that. Follow these steps:

- Open YaST
- Filesystem Snapshots
- Create

## Install media codecs

### For KDE

    curl -o https://www.opensuse-community.org/codecs-kde.ymp


### For Gnome

    curl -o https://www.opensuse-community.org/codecs-gnome.ymp


Double click on the downloaded file to install codecs

## Enable communite repositories

Check out [community repositories](https://en.opensuse.org/Additional_package_repositories).
To add:

- YaST
- Software Repositories
- Add
- Select Community Repositories

Or by command

    sudo zypper ar -cfp 999 https://ftp.fau.de/packman/suse/openSUSE_Tumbleweed/Essentials packman-essentials
    sudo zypper dist-upgrade --from packman-essentials --allow-vendor-change


## Install Microsoft fonts

- YaST
- Software Management
- Search `fetchmsttfonts`
- Install


## Change swap file sensitivity

Add `vm.swappiness=10` to `/etc/sysctl.conf` then reboot.

## Decrease GRUB boot delay

It's default to 9 or something. To change,

- YaST
- Boot Loader
- Bootloader Options
- Timeout -> 4, or less

