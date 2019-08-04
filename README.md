# Scripts
## Multi-purpose linux shell scripts

There are three main types of scripts in this repository i.e. scripts for a Pytorch Google Compute Instance (Pytorch folder),  scripts for a Tensorflow Google Compute Instance (Tensorflow folder) and a script for setting up essential packages on your local Ubuntu OS (Setup.sh).

## Tensorflow Scripts
In the Tensorflow folder, there are 2 .sh files. 

The first file i.e. **tf-GCP.sh** can be used to create a tensorflow GCP instance with an Nvidia Tesla K-80 GPU, 200GB storage, 4 vCPUs, and 26 GB RAM. It will auto-install the Nvidia driver.

Usage:  `sh tf-GCP.sh <INSTANCE_NAME>`

The second file i.e. **tf-ssh.sh** can be used to start the Tensorflow instance and ssh into it from the terminal without going to the Google Cloud webpage.

Usage: `sh tf-ssh.sh `

## Pytorch Scripts
In the Pytorch folder, there are 2 .sh files. 

The first file i.e. **pytorch-GCP.sh** can be used to create a Pytorch GCP instance with an Nvidia Tesla K-80 GPU, 200GB storage, 4 vCPUs, and 26 GB RAM. It will auto-install the Nvidia driver.

Usage:  `sh pytorch-GCP.sh <INSTANCE_NAME>`

The second file i.e. **pyt-ssh.sh** can be used to start the Pytorch instance and ssh into it from the terminal without going to the Google Cloud webpage.

Usage: `sh tf-ssh.sh `

## Fastai local setup Scripts
Int the "fastai-local" folder, there is a .sh file that creates and activates a conda fastai environment using the fastai course v3 yml file.
