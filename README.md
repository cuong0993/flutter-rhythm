# Hit Notes - Play instruments

![Analyze, build and distribute Android application](https://github.com/cuong0993/HitNotes/workflows/Analyze,%20build%20and%20distribute%20Android%20application/badge.svg)

Rhythm-based mobile game. Even you don't have any basic knowledge of music instruments, you still can play with falling notes in the game! ✨

Currently available on the Play store.

<a href='https://play.google.com/store/apps/details?id=com.chaomao.hittick'><img alt='Get it on Google Play' src='https://play.google.com/intl/en_us/badges/images/generic/en_badge_web_generic.png' height='80px'/></a>

# Main Features

- Hundreds of songs, from classics of Beethoven, Chopin, Mozart, or Schubert, folk songs to POP/EDM. Will be updated continuously
- Adjustable difficulty level
- Adjustable tempo
- Many game modes
- Many musical instruments
- Play offline without the internet
- Upload your song and play your way

![screenshots](./fastlane/metadata/en-US/images/phoneScreenshots/1_en-US.png)
![screenshots](./fastlane/metadata/en-US/images/phoneScreenshots/2_en-US.png)
![screenshots](./fastlane/metadata/en-US/images/phoneScreenshots/3_en-US.png)

# Project Structure

This is a Flutter mobile game targeting Android and iOS.

The code for the Flutter app is contained in the folder `lib` and the
different native apps are in `android` and `ios`.

Extra project assets are in `assets`.

Firebase config files and cloud functions are in the `firebase` folder.

Google Play store listing files are in the `fastlane` folder.

# Prerequisites & Getting Started

## Client 

To build and run the mobile apps you’ll need to install [Flutter](https://flutter.dev) and its dependencies. To verify your installation run in the project’s root directory:**‌**

```
$ flutter doctor
```

## Backend (Firebase)

The backend is build using Firebase’s `node.js` SDK. All files are provided in the `firebase` folder. To deploy the code create an app and install the firebase CLI (See steps 1 & 2 in [Getting started](https://firebase.google.com/docs/functions/get-started)).

### B1. Setup sign-in method
An initial sign-in method needs to be configured.

- Select your project in [console.firebase.google.com](https://console.firebase.google.com). 
- Navigate to `Authentication` 
- Select `Sign-in methods` and activate `Google`, `Facebook` and `Anonymous`.

### B2. Configure firebase app

Next, you’ll need to configure your firebase app for Flutter as described in [Add Firebase to an App / Flutter](https://firebase.google.com/docs/flutter/setup)

**Android**

Follow the instructions in `android/README.md`.

### B3. Deploy firebase functions 

Navigate to the `functions/functions` directory and deploy all functions and configuration using:

```
$ gcloud functions deploy OnUserSignUp --entry-point functions.OnUserSignUp --runtime java11 --trigger-event providers/firebase.auth/eventTypes/user.create --project={projectId} --update-env-vars "GOOGLE_CLOUD_PROJECT={projectId}" --memory=128MB --timeout=540s;
$ gcloud functions deploy OnUserDeleted --entry-point functions.OnUserDeleted --runtime java11 --trigger-event providers/firebase.auth/eventTypes/user.delete --project={projectId} --update-env-vars "GOOGLE_CLOUD_PROJECT={projectId}" --memory=128MB --timeout=540s;
$ gcloud functions deploy GetGameReward --entry-point functions.GetGameReward --runtime java11 --trigger-http --allow-unauthenticated --project={projectId} --update-env-vars "GOOGLE_CLOUD_PROJECT={projectId}" --memory=256MB --timeout=540s;
```

### B4. Synchronize storage 

Install Google Cloud SDK, navigate to the `storage` directory and synchronize storage files using:

```
$ gsutil -m rsync -r -d ./ gs://{projectId}.appspot.com
```

### B4. Synchronize database 

Install https://github.com/jloosli/node-firestore-import-export, get service account json file https://firebase.google.com/docs/admin/setup#initialize-sdk, navigate to the `database` directory, backup/restore database using:

```
$ export GOOGLE_APPLICATION_CREDENTIALS="service-account.json"; ./backup-firestore.sh
$ export GOOGLE_APPLICATION_CREDENTIALS="service-account.json"; ./restore-firestore.sh
```
