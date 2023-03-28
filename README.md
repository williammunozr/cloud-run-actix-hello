# Cloud Run and Rust Web App

## Set Kaniko to True

```commanline
gcloud config set builds/use_kaniko True
```

## Build the image

```commandline
gcloud builds submit --tag gcr.io/development-id/cloud-run-actix-hello --timeout=2000 
```

## Load testing

```commandline
wrk -t8 -c256 -d30s https://cloud-run-actix-hello-s5ok4ecboa-uc.a.run.app
```
