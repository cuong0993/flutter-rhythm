# Hit Notes app

![Analyze, build and distribute Android application](https://github.com/cuong0993/HitNotes/workflows/Analyze,%20build%20and%20distribute%20Android%20application/badge.svg)

An amazing open-source group messaging app build with flutter. ✨

# Main Features

- Multiple groups (similar to Teams in Slack).
- Multiple *open or private* channels within groups.
- Sharing of photos and photo collections.
- React to messages with emoji. 
- Push-notifications for the message and channel updates.
- Specific channels for events (e.g. containing date, venue).
- Editing of event channels.
- Calendar for all upcoming and past events aggregated over all groups and channels.
- English and German localization.
- RSVP for events.


![screenshots](./timy.png)





# Project Structure

This is a Flutter mobile app targeting Android and iOS.

The code for the Flutter app is contained in the folder `lib` and the
different native apps are in `android` and `ios`. Extra project assets are in
`assets` and `fonts`.

As well, this repo hosts a series of Firebase config files and cloud functions.

The documentation for Firebase part is inside the `firebase` folder.


# Prerequisites & Getting Started

## Client 

To build and run the mobile apps you’ll need to install [Flutter](https://flutter.dev) and its dependencies. To verify your installation run in the project’s root directory:**‌**

```
$ flutter doctor
```

The app is optimised for Android and iOS phones in portrait mode.

**IMPORTANT:** The project only supports Flutter version 1.10.5, you will have to change your configuration to it.
We cannot make sure that other Flutter versions will work.

```
$ flutter version 1.10.5
```

**Note:** Additionally you’ll need to setup the backend and add the GoogleService-Info of your Firebase app to your clients as described below.

## Backend (Firebase)

The backend is build using Firebase’s `node.js` SDK. All files are provided in the `firebase` folder. To deploy the code create an app and install the firebase CLI (See steps 1 & 2 in [Getting started](https://firebase.google.com/docs/functions/get-started)).

*Note: The following steps assume you’re using Firebases’ free `Spark Plan`. Therefore we’re performing the configuration manually.*

### B1. Setup sign-in method & adding users

An initial sign-in method needs to be configured.

- Select your project in [console.firebase.google.com](https://console.firebase.google.com). 
- Navigate to `Authentication` 
- Select `Sign-in methods` and activate `Email / Password`.

**Adding a user**

Currently, users need to be added *manually*.  

- In firebase navigate to `Authentication` and select `Users`. 
- Then `Add user`. 

Please copy the `User-UID` of the created user. We’ll need to add this ID to a group in the next step.

*Note: You’ll need to have at least one user configured to use the app.*

### B2. Configure firebase app

Next, you’ll need to configure your firebase app for Flutter as described in [Add Firebase to an App / Flutter](https://firebase.google.com/docs/flutter/setup)

**iOS**

- Enter iOS-Bundle-ID: `de.janoodle.circlesApp.debug`
- Download and rename `GoogleService-Info.plist` to  `GoogleService-Info-Dev.plist`.
- Copy file to `ios/Runner/Firebase`.

*NOTE: If you’re building for release you’ll additionally need to add a GoogleService-Info-Prod.plist pointing to your production Firebase app.*

**Android**

Follow the instructions in `android/README.md`.

# Deployment

The app is setup to work with a development and production environment. We suggest you create a different Firebase app for each environment. 

When building for release the app will automatically use the production configuration that you’ve configured in step `B3`.
