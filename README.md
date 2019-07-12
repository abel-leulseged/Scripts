# Scripts
## Multi-purpose linux shell scripts

There are three main types of scripts in this repository i.e. scripts for a Pytorch Google Compute Instance (Pytorch folder),  scripts for a Tensorflow Google Compute Instance (Tensorflow folder) and a script for setting up essential packages on your local Ubuntu OS (Setup.sh).

## Tensorflow Scripts
In the Tensorflow folder, there are 2 .sh files. **tf-GCP.sh** can be used to create a tensorflow GCP instance with an Nvidia Tesla K-80 GPU, 200GB storage, 4 vCPUs, and 26 GB RAM. It will auto-install the Nvidia driver.

Usage:  sh tf-GCP.sh <INSTANCE_NAME>
