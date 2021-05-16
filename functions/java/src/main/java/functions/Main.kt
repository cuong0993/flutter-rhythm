package functions

import com.google.auth.oauth2.GoogleCredentials
import com.google.cloud.firestore.FirestoreOptions
import com.google.firebase.FirebaseApp
import com.google.firebase.FirebaseOptions

val firebaseApp: FirebaseApp by lazy {
    val firebaseOption = FirebaseOptions.builder()
            .setCredentials(GoogleCredentials.getApplicationDefault())
            .setFirestoreOptions(
                    FirestoreOptions.newBuilder()
                            .build()
            )
            .build()
    FirebaseApp.initializeApp(firebaseOption)
}
