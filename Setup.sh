# Disable Nvidia nouveau driver
sudo bash -c "echo blacklist nouveau > /etc/modprobe.d/blacklist-nvidia-nouveau.conf"
sudo bash -c "echo options nouveau modeset=0 >> /etc/modprobe.d/blacklist-nvidia-nouveau.conf"
sudo update-initramfs -u

# Basics
sudo apt-get install -y git
sudo apt-get install -y curl
sudo apt-get install -y zsh
sudo apt-get install -y hexchat
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Latex
sudo apt-get install -y texlive-full
sudo apt-get install -y texmaker

# Install VSCODE
sudo apt update
sudo apt install software-properties-common apt-transport-https wget
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
sudo apt-get update
sudo apt-get upgrade
sudo apt install code

# Time Diff
timedatectl set-local-rtc 0

# Install Chrome
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' | sudo tee /etc/apt/sources.list.d/google-chrome.list
sudo apt-get update 
sudo apt-get install -y google-chrome-stable

# Spotify
curl -sS https://download.spotify.com/debian/pubkey.gpg | sudo apt-key add - 
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt-get update && sudo apt-get install spotify-client


# Musixmatch
# https://download-app.musixmatch.com/

# Install Anaconda
sudo apt-get install libgl1-mesa-glx libegl1-mesa libxrandr2 libxrandr2 libxss1 libxcursor1 libxcomposite1 libasound2 libxi6 libxtst6
wget https://repo.anaconda.com/archive/Anaconda3-2019.03-Linux-x86_64.sh
bash Anaconda3-2019.03-Linux-x86_64.sh
echo 'export PATH=~/anaconda3/bin:$PATH' >> ~/.zshrc
rm Anaconda3-2019.03-Linux-x86_64.sh

# XDMAN
wget https://sourceforge.net/projects/xdman/files/xdm-2018-x64.tar.xz
tar -xvf xdm-2018-x64.tar.xz
rm xdm-2018-x64.tar.xz
sudo ./install.sh
rm install.sh readme.txt


# Deluge (Torrent Client)
sudo add-apt-repository ppa:deluge-team/ppa
sudo apt install deluge 

# Setup default conda virtual environment for projects
conda create -n projects python=3.6
echo 'source activate projects' >> ~/.zshrc
conda install -c conda-forge ipywidgets -y
pip install kaggle

# Nvidia and cuda
sudo add-apt-repository ppa:graphics-drivers/ppa
sudo apt update
sudo apt install nvidia-driver-396
sudo reboot

# cuda
wget http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/cuda-repo-ubuntu1804_10.1.168-1_amd64.deb
sudo dpkg -i cuda-repo-ubuntu1804_10.1.168-1_amd64.deb
sudo apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/7fa2af80.pub
sudo apt-get update
sudo apt-get install cuda

# cuDNN
wget https://developer.download.nvidia.com/compute/machine-learning/cudnn/secure/v7.6.1.34/prod/10.1_20190620/cudnn-10.1-linux-x64-v7.6.1.34.tgz?8rGe05RSdL3wR5UOQNJEZbab_8R4Xv4oxBoJ6jWyf20rM7HrFYgg5udUW5XaAykR3xs1g-exTJwutcTA3aW_oYOSlxQjvmav1ie3oUfdtEzMUucqj2rjyrhLErPJ44AV6msLZKCVcB_cJ3g0ehNbsFm_glBKIT56tySo4c1pZR6mKiRbGaJ92HXtFNOP5g38GhOwE4Fy6BarGhb3TRCpAST6yGQ
tar -zxvf cudnn-10.1-linux-x64-v7.6.1.34.tgz?8rGe05RSdL3wR5UOQNJEZbab_8R4Xv4oxBoJ6jWyf20rM7HrFYgg5udUW5XaAykR3xs1g-exTJwutcTA3aW_oYOSlxQjvmav1ie3oUfdtEzMUucqj2rjyrhLErPJ44AV6msLZKCVcB_cJ3g0ehNbsFm_glBKIT56tySo4c1pZR6mKiRbGaJ92HXtFNOP5g38GhOwE4Fy6
sudo cp -P cuda/lib64/libcudnn* /usr/local/cuda-10.1/lib64/
sudo cp  cuda/include/cudnn.h /usr/local/cuda-10.1/include/
sudo chmod a+r /usr/local/cuda-10.1/include/cudnn.h /usr/local/cuda/lib64/libcudnn*
sudo apt-get -y install libcupti-dev
echo 'export PATH=/usr/local/cuda-10.1/bin${PATH:+:${PATH}}' >> ~/.zshrc
echo 'export LD_LIBRARY_PATH=/usr/local/cuda/lib64:${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}' >> ~/.zshrc
source ~/.zshrc
pip install --upgrade tensorflow-gpu

# VLC
sudo apt install -y vlc

# Slack
wget https://downloads.slack-edge.com/linux_releases/slack-desktop-3.4.2-amd64.deb
sudo dpkg -i slack-desktop-3.4.2-amd64.deb
rm slack-desktop-3.4.2-amd64.deb

# OpenCV
conda install -c conda-forge opencv
conda install pydot

# Gcloud setup
sudo apt-get install -y sshfs
export CLOUD_SDK_REPO="cloud-sdk-$(lsb_release -c -s)"

echo "deb http://packages.cloud.google.com/apt $CLOUD_SDK_REPO main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
sudo apt-get update && sudo apt-get install -y google-cloud-sdk

# https://www.cyberciti.biz/faq/google-cloud-compute-engin-ssh-into-an-instance-from-linux-unix-appleosx/

# Battery Life Issues
# https://medium.com/@tomwwright/better-battery-life-on-ubuntu-17-10-4588b7f72def

# Finish Up
sudo apt update
sudo apt upgrade

cat aliases.txt >> ~/.zshrc
# ALIASES AND FUNCTIONS
# alias mount_wilkes='sshfs atadesse@wilkes.cs.hmc.edu:/home/atadesse/ ~/Wilkes/'
# alias unmount_wilkes='fusermount -u ~/Wilkes/'
