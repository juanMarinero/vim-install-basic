* [Install VirtualBox](#install-virtualbox)
* [Install Ubuntu in a Virtual Machine](#install-ubuntu-in-a-virtual-machine)
* [Guest Additions](#guest-additions)
  * [Install Guest Additions](#install-guest-additions)
  * [Enable Clipboard](#enable-clipboard)
  * [Set Screen Resolution](#set-screen-resolution)
  * [Shared Folder](#shared-folder)
* [Bonus - How to Use Snapshots](#bonus---how-to-use-snapshots)

## Install VirtualBox

VirtualBox installation depends on your OS, i.e. on your physical computer, which is called <u>**host**</u>:
- **Windows**. Read [virtualbox-docs](https://www.virtualbox.org/manual/topics/installation.html#installation_windows), [itsfoss](https://itsfoss.com/install-virtualbox-windows/), [wikihow](https://www.wikihow.com/Install-VirtualBox), watch video tutorials,... Then read section [Install Ubuntu 24.04 Virtual Machine](#install-ubuntu-24.04-virtual-machine)
- For **Ubuntu 24.04** follow next steps:

1. Download the VirtualBox package for Ubuntu 24.04 from the official VirtualBox website:
[virtualbox/Downloads](https://www.virtualbox.org/wiki/Downloads) go to [Download VirtualBox for Linux Hosts](https://www.virtualbox.org/wiki/Linux_Downloads)

2. Install it

```
cd ~/Downloads
sudo dpkg -i virtualbox*.deb
```

3. If there are any dependency issues, run:

```
sudo apt-get install -f
sudo dpkg -i virtualbox*.deb # again
virtualbox --help # check version
```

Alternative installation using Oracle’s repository at [itsfoss](https://itsfoss.com/install-virtualbox-ubuntu/#method-3-install-virtualbox-using-oracle%E2%80%99s-repository).

Official [docs](https://www.virtualbox.org/manual/topics/installation.html#install-linux-host) and quick [wiki](https://www.virtualbox.org/wiki/Linux_Downloads) for Ubuntu/Debian.

## Install Ubuntu in a Virtual Machine

1. Download an Ubuntu ISO file from https://ubuntu.com/download/desktop

2. Open Virtual Box. Click on *Machine/New*

3. Set name, ISO image location (of step 1), OS, memory, CPUs,...Example:
- General:
    - Name: U24.04_150Gb
    - Operating System: Ubuntu (64-bit)
    - Settings File Location: /home/\<user\>/VirtualBox VMs/U24.04_150Gb
- System:
    - Base Memory: 12000 MB
    - Processors: 10
- Storage:
    - Create a Virtual Hard Disk (vdi): 150 GB
- ...

4. Do **check** the *Skip Unattended Installation* checkbox. [Screenshot](https://superuser.com/questions/1749837/cant-open-a-terminal-in-ubuntu-22-04-running-in-virtualbox-7-0-on-a-windows-11/1835756#1835756). This way you will see a detailed step-by-step installation process.

5. Click *Finish*

6. Wait for installation to finish. Fill user, password, keyboard, timezone,...


## Guest Additions

### Install Guest Additions

After installation of VM, install guest additions. See details and screenshots in [linuxtechi.com](https://www.linuxtechi.com/install-virtualbox-guest-additions-on-ubuntu/).

Install Required Packages. Start the VM, open a terminal and run
```bash
sudo apt update
sudo apt install -y build-essential dkms linux-headers-$(uname -r)
```

In VirtualBox interface:
1. Go to *Devices* menu at the top of the virtual machine window
2. Select *Insert Guest Additions CD Image.* This action virtually mount the Guest Additions CD image into your virtual machine.

In VM terminal install the additions
```bash
cd /media/$(whoami)/VBox_GAs_*
sudo ./VBoxLinuxAdditions.run && sudo reboot
```

After reboot verify installation

1. Check VM termianl output
```bash
lsmod | grep vbox
```

2. Check automatic screen resizing and seamless mouse integration.
![Screen Resize Post VirtualBox Guest Addition](https://www.linuxtechi.com/wp-content/uploads/2023/09/Screen-Resize-Post-VirtualBox-Guest-Addition.gif)

<p style="text-align: right;">
  <em>GIF sourced from <a href="https://www.linuxtechi.com/install-virtualbox-guest-additions-on-ubuntu/#6_Verify_Guest_Additions_Installation">linuxtechi.com</a></em>
</p>


### Enable Clipboard

1. Click on *Machine/Settings/General/Advanced* and set:
  - *Shared Clipboard* as *Bidirectional*
  - *Drag'n'Drop* as *Disabled* is my personal preference
2. Start the VM. Try to copy text from host and paste into VM, then vice versa


### Set Screen Resolution

During installation of VM you might not be able to change the resolution size.

After installation of *Guest Additions* set the highest resolution in the menu *View/Virtual Screeen*


### Shared Folder

1. Create in host a shared folder and paste there any file

In host run
```bash
dir01="/home/$(whoami)/VirtualBox VMs/U24.04_150Gb__sharedDir/"
mkdir "$dir01"
cp -v /usr/share/backgrounds/ubuntu-wallpaper* "$dir01"
```

2. VirtualBox select the desired VM, go to menu *Settings/Shared Folders*
  - Click on *Add new shared folder* (at right)
  - Set folderpath (replace *user* with your username): `/home/user/VirtualBox VMs/U24.04_150Gb__sharedDir/`
  - Set mount point: `/media/host_VM_sharedDir`
  - Set *automount* and *make permanent*
3. Start the VM. Open a terminal and run:
```bash
sudo usermod -aG vboxsf $USER
sudo reboot
```

Check that the shared folder should automatically be mount at `/media/host_VM_sharedDir/`:
```bash
xdg-open /usr/share/backgrounds/ubuntu-wallpaper*.png
```

If not working, then manually mount it:
```bash
sudo mount -t vboxsf U24.04_150Gb__sharedDir /media/host_VM_sharedDir

# To make the mount persistent across reboots, add this line to /etc/fstab:
echo "U24.04_150Gb__sharedDir /media/host_VM_sharedDir vboxsf defaults 0 0" >> /etc/fstab

# Set appropriate permissions:
sudo chown $USER:$USER /media/host_VM_sharedDir
sudo chmod 755 /media/host_VM_sharedDir
```

Still troubles? See virtualbox-docs concerning:
- [Sharedfolders](https://www.virtualbox.org/manual/topics/guestadditions.html#sharedfolders)
- [Guest additions](https://www.virtualbox.org/manual/topics/guestadditions.html#guestadditions)
- [Linux guest additions](https://www.virtualbox.org/manual/topics/guestadditions.html#additions-linux-install)
- Or ask on [r/virtualbox subreddit](https://www.reddit.com/r/virtualbox/).


## Bonus - How to Use Snapshots

Excellent Corey Schafer [video](https://www.youtube.com/watch?v=Qte4X-rdr2Q).
