# Install Anaconda
sudo apt-get install -Y libgl1-mesa-glx libegl1-mesa libxrandr2 libxrandr2 libxss1 libxcursor1 libxcomposite1 libasound2 libxi6 libxtst6
wget https://repo.anaconda.com/archive/Anaconda3-2019.03-Linux-x86_64.sh
bash Anaconda3-2019.03-Linux-x86_64.sh
echo 'export PATH=~/anaconda3/bin:$PATH' >> ~/.bashrc
rm Anaconda3-2019.03-Linux-x86_64.sh

# Setup default conda virtual environment for tf projects
conda create --name tf_gpu tensorflow-gpu 
echo 'source activate tf_gpu' >> ~/.bashrc
conda install -c conda-forge ipywidgets -y

pip install kaggle
pip install jupyter
conda install -c conda-forge jupyterlab -y

# Setup Jupyter config so that it is listening not just on local network
# but also on external network.  Otherwise, we can't reach it via its IP address.
mkdir -p ~/.jupyter
cat >  ~/.jupyter/jupyter_notebook_config.py << HERE_DOC
c = get_config()
c.NotebookApp.ip = '*'
c.NotebookApp.open_browser = False
c.NotebookApp.allow_remote_access = True
HERE_DOC

pip install keras
