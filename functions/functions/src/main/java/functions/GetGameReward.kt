package functions

import com.google.cloud.functions.HttpFunction
import com.google.cloud.functions.HttpRequest
import com.google.cloud.functions.HttpResponse
import com.google.firebase.auth.FirebaseAuth
import com.google.firebase.cloud.FirestoreClient
import com.google.gson.Gson
import com.google.gson.JsonElement
import com.google.gson.JsonObject
import java.util.logging.Logger

@Suppress("unused")
class GetGameReward : HttpFunction {
    @Throws(Exception::class)
    override fun service(request: HttpRequest, response: HttpResponse) {
        try {
            val requestParsed: JsonElement = gson.fromJson(request.reader, JsonElement::class.java)
            val requestJson: JsonObject? =
                    if (requestParsed.isJsonObject) {
                        requestParsed.asJsonObject
                    } else null
            if (requestJson != null) {
                val jsonElements = requestJson["data"] as JsonObject
                val songId = jsonElements["songId"].asString
                val difficulty = jsonElements["difficulty"].asInt
                val speed = jsonElements["speed"].asInt
                val errorCount = jsonElements["errorCount"].asInt

                val token = request.headers["Authorization"]?.get(0)?.substring(7)
                if (token != null) {
                    val decodedToken = FirebaseAuth.getInstance(firebaseApp).verifyIdToken(token)
                    val uid = decodedToken.uid
                    logger.info("User $uid is getting game reward with songId ${songId}, difficulty ${difficulty}, speed ${speed}, errorCount $errorCount")
                    val db = FirestoreClient.getFirestore(firebaseApp)
                    val userRef = db.collection("users").document(uid)
                    val userSnapshot = userRef.get().get()
                    if (!userSnapshot.exists()) {
                        logger.info("Cannot retrieve user information")
                    }
                    val user = userSnapshot.toObject(User::class.java)!!
                    val songRef = db.collection("songs").document(songId)
                    val songSnapshot = songRef.get().get()
                    if (!songSnapshot.exists()) {
                        logger.info("Cannot retrieve played song information")
                    }
                    val song = songSnapshot.toObject(Song::class.java)!!

                    val tilesCount = song.tilesCount[difficulty]
                    val errorPercent = errorCount / tilesCount
                    val stars = when {
                        errorPercent <= 0.05 -> {
                            3
                        }
                        errorPercent <= 0.2 -> {
                            2
                        }
                        else -> {
                            1
                        }
                    }

                    val newUser = user.copy(playedNotes = user.playedNotes + tilesCount, stars = user.stars + stars, playedTime = user.playedTime + song.duration[speed])
                    userRef.set(newUser).get()

                    val reward = GameReward(
                            stars,
                            tilesCount)
                    logger.info("Reward of the user is $reward")
                    response.setContentType("application/json; charset=utf-8")
                    val toJson = gson.toJson(mapOf("result" to reward))
                    logger.info(toJson)
                    response.writer.write(toJson)
                    response.writer.close()
                }
            }
        } catch (e: Exception) {
            logger.severe("Error " + e.message)
        }
    }

    companion object {
        private val logger = Logger.getLogger(GetGameReward::class.java.name)
        private val gson = Gson()
    }
}