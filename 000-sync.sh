echo                                    >> ~/.update.log
echo $date                              >> ~/.update.log
echo                                    >> ~/.update.log
echo "-------- [pacman -Syu]--------"   >> ~/.update.log
sudo pacman -Syu                        >> ~/.update.log
