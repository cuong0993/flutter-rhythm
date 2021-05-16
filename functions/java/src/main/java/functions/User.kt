package functions

import java.util.*

data class User(
    val id: String = "",
    val playedNotes: Int = 0,
    val stars: Int = 0,
    val playedTime: Int = 0,
    val instrumentId: String = "piano",
    val name: String = "",
    val photoUrl: String = "",
    val anonymous: Boolean = true,
    val creationTime: Date = Date(),
)