import * as firebase from 'firebase-admin';
import { sendNewSongNotification } from '../notification';
import { Song } from '../model/song';

firebase.initializeApp();
sendNewSongNotification({ title: 'Song name', artist: 'Song artist' } as Song);
