package functions

import com.google.cloud.functions.Context
import com.google.cloud.functions.RawBackgroundFunction
import com.google.firebase.cloud.FirestoreClient
import com.google.gson.Gson
import com.google.gson.JsonObject
import java.util.*
import java.util.logging.Logger

@Suppress("unused")
class OnUserSignUp : RawBackgroundFunction {
    override fun accept(json: String, context: Context) {
        val body = gson.fromJson(json, JsonObject::class.java)
        if (body != null && body.has("uid")) {
            val db = FirestoreClient.getFirestore(firebaseApp)
            val uid = body["uid"].asString
            val docRef = db.collection("users").document(uid)
            val user = User(
                id = uid,
                playedNotes = 0,
                stars = 0,
                playedTime = 0,
                instrumentId = "piano",
                name = "",
                photoUrl = "",
                anonymous = true,
                creationTime = Date()
            )
            docRef.set(user).get()
            logger.info("Create profile success $uid")
        }
    }

    companion object {
        private val logger = Logger.getLogger(OnUserSignUp::class.java.name)
        private val gson = Gson()
    }
}