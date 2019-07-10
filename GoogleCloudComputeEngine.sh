# Install Anaconda
sudo apt-get install -Y libgl1-mesa-glx libegl1-mesa libxrandr2 libxrandr2 libxss1 libxcursor1 libxcomposite1 libasound2 libxi6 libxtst6
wget https://repo.anaconda.com/archive/Anaconda3-2019.03-Linux-x86_64.sh
bash Anaconda3-2019.03-Linux-x86_64.sh
echo 'export PATH=~/anaconda3/bin:$PATH' >> ~/.bashrc
rm Anaconda3-2019.03-Linux-x86_64.sh
source ~/.bashrc

# Setup default conda virtual environment for tf projects
conda create --name tf_gpu --file requirements.txt
