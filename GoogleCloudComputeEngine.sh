# Install Anaconda
sudo apt-get install libgl1-mesa-glx libegl1-mesa libxrandr2 libxrandr2 libxss1 libxcursor1 libxcomposite1 libasound2 libxi6 libxtst6
wget https://repo.anaconda.com/archive/Anaconda3-2019.03-Linux-x86_64.sh
bash Anaconda3-2019.03-Linux-x86_64.sh
echo 'export PATH=~/anaconda3/bin:$PATH' >> ~/.zshrc
rm Anaconda3-2019.03-Linux-x86_64.sh

# Setup default conda virtual environment for projects
conda create -n projects python=3.6
echo 'source activate projects' >> ~/.zshrc
conda install -c conda-forge ipywidgets -y
pip install kaggle

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

# cuda
wget http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/cuda-repo-ubuntu1604_10.1.168-1_amd64.deb
sudo dpkg -i cuda-repo-ubuntu1604_10.1.168-1_amd64.deb
sudo apt-key adv --fetch-keys http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/7fa2af80.pub
sudo apt-get update
sudo apt-get install cuda

# cuDNN
wget https://developer.download.nvidia.com/compute/machine-learning/cudnn/secure/v7.6.1.34/prod/10.1_20190620/cudnn-10.1-linux-x64-v7.6.1.34.tgz?8rGe05RSdL3wR5UOQNJEZbab_8R4Xv4oxBoJ6jWyf20rM7HrFYgg5udUW5XaAykR3xs1g-exTJwutcTA3aW_oYOSlxQjvmav1ie3oUfdtEzMUucqj2rjyrhLErPJ44AV6msLZKCVcB_cJ3g0ehNbsFm_glBKIT56tySo4c1pZR6mKiRbGaJ92HXtFNOP5g38GhOwE4Fy6BarGhb3TRCpAST6yGQ
tar -zxvf cudnn-10.1-linux-x64-v7.6.1.34.tgz?8rGe05RSdL3wR5UOQNJEZbab_8R4Xv4oxBoJ6jWyf20rM7HrFYgg5udUW5XaAykR3xs1g-exTJwutcTA3aW_oYOSlxQjvmav1ie3oUfdtEzMUucqj2rjyrhLErPJ44AV6msLZKCVcB_cJ3g0ehNbsFm_glBKIT56tySo4c1pZR6mKiRbGaJ92HXtFNOP5g38GhOwE4Fy6
sudo cp -P cuda/lib64/libcudnn* /usr/local/cuda-10.1/lib64/
sudo cp  cuda/include/cudnn.h /usr/local/cuda-10.1/include/
sudo chmod a+r /usr/local/cuda-10.1/include/cudnn.h /usr/local/cuda/lib64/libcudnn*
sudo apt-get -y install libcupti-dev
echo 'export PATH=/usr/local/cuda-10.1/bin${PATH:+:${PATH}}' >> ~/.bashrc
echo 'export LD_LIBRARY_PATH=/usr/local/cuda/lib64:${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}' >> ~/.bashrc
source ~/.bashrc
pip install --upgrade tensorflow-gpu
pip install keras