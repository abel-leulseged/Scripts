conda deactivate 
conda env create -f enviroment.yml
conda activate projects
python -m ipykernel install --user --name projects --display-name "Python (projects)"
