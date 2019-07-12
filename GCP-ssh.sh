export ZONE="us-west1-b"
export INSTANCE_NAME="abel-tf"
gcloud compute instances start INSTANCE_NAME --zone=$ZONE 
gcloud compute ssh --zone=$ZONE jupyter@$INSTANCE_NAME -- -L 8080:localhost:8080