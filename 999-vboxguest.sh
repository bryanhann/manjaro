echo
echo Insure that the virtualbox 'Guest Additions' cd is attached. Then press enter.
echo
read
pamac install virtual-guest-utils 
$( pacman -Qsq "^linux"  |  grep "^linux[0-9]*[-rt]*$"  |  awk '{print $1"-virtualbox-guest-modules"}' ORS=''  )
sudo modprobe vboxguest vboxvideo vboxsf
sudo gpasswd -a $USER vboxsf
sudo systemctl enable --now vbox.service.service
