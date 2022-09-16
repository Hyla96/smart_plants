deploy:
	gcloud run deploy smart-plants-web-api --source build --project=smartplants000012 --region=europe-west3 --allow-unauthenticated

build:
	dart run build_runner build

