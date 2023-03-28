# Cloud Run and Rust Web App

## Set Kaniko to True

```commanline
gcloud config set builds/use_kaniko True
```

## Build the image

```commandline
gcloud builds submit --tag gcr.io/development-id/cloud-run-actix-hello --timeout=2000 
```
