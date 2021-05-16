cd storage; gsutil -m rsync -r -d ./ gs://$1.appspot.com;
cd ../functions/functions;
gcloud functions deploy OnUserSignUp --entry-point functions.OnUserSignUp --runtime java11 --trigger-event providers/firebase.auth/eventTypes/user.create --project=$1 --update-env-vars "GOOGLE_CLOUD_PROJECT=$1" --memory=256MB --timeout=540s;
gcloud functions deploy OnUserDeleted --entry-point functions.OnUserDeleted --runtime java11 --trigger-event providers/firebase.auth/eventTypes/user.delete --project=$1 --update-env-vars "GOOGLE_CLOUD_PROJECT=$1" --memory=256MB --timeout=540s;
gcloud functions deploy GetGameReward --entry-point functions.GetGameReward --runtime java11 --trigger-http --allow-unauthenticated --project=$1 --update-env-vars "GOOGLE_CLOUD_PROJECT=$1" --memory=256MB --timeout=540s;
cd ..;
firebase deploy --only firestore --project $1;
firebase deploy --only storage --project $1;
