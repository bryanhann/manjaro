echo                                    >> ~/.update.log
echo $date                              >> ~/.update.log
echo                                    >> ~/.update.log
echo "-------- [pacman --noconfirm -Syu]--------"   >> ~/.update.log
sudo pacman --noconfirm -Syu                        >> ~/.update.log
