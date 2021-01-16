# Android client

## Setting up Firebase

Create a project on the Firebase console [here](https://console.firebase.google.com/)

1. To add Firebase to your app, click on the android icon or click the gear icon to go to project
settings to find the android icon.

2. Register your application by filing up the form with the package name (applicationId) 
and the app nickname if you like.
> Find Your package name which is generally the applicationId in your app-level build.gradle file

3. Download the `google-service.json` file that is generated for you. Find it and move it inside
the folder `android/app/` of the project. The firebase sdk is already added to the project.

4. On the fourth step of registration, run the app to verify the configuration via the Firebase
console.

## Distribution

To build this application for distribution, 
provide files `debug.jks` and `release.jks` containing the signing keys, 
and the `key.properties` with the following content:

```
debugStorePassword=.....
debugKeyPassword=.....
debugKeyAlias=.....
debugStoreFile=../debug.jks
releaseStorePassword=.....
releaseKeyPassword=.....
releaseKeyAlias=.....
releaseStoreFile=../release.jks
```
