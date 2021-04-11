package functions

import com.google.cloud.functions.Context
import com.google.cloud.functions.RawBackgroundFunction
import com.google.firebase.cloud.FirestoreClient
import com.google.gson.Gson
import com.google.gson.JsonObject
import java.util.logging.Logger

@Suppress("unused")
class OnUserDeleted : RawBackgroundFunction {
    override fun accept(json: String, context: Context) {
        val body = gson.fromJson(json, JsonObject::class.java)
        if (body != null && body.has("uid")) {
            val db = FirestoreClient.getFirestore(firebaseApp)
            val uid = body["uid"].asString
            val docRef = db.collection("users").document(uid)
            val userSnapshot = docRef.get().get()
            if (!userSnapshot.exists()) {
                logger.info("Cannot retrieve user information")
            }
            docRef.delete().get()
            logger.info("Deleted profile $uid")
        }
    }

    companion object {
        private val logger = Logger.getLogger(OnUserDeleted::class.java.name)
        private val gson = Gson()
    }
}