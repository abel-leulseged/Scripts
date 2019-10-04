export ZONE="us-west1-b"
export INSTANCE_NAME="abel-tf"
gcloud compute instances start INSTANCE_NAME --zone=$ZONE 
echo 'Click here to open Jupyter Lab: http://localhost:8080/lab'
gcloud compute ssh -q --zone=$ZONE jupyter@$INSTANCE_NAME -- -L 8080:localhost:8080