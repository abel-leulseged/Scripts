conda deactivate 
conda env create -f enviroment.yml
conda activate fastai
python -m ipykernel install --user --name fastai --display-name "Python (fastai)"
