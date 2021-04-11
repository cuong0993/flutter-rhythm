package functions

data class User(
        val id: String = "",
        val playedNotes: Int = 0,
        val stars: Int = 0,
        val playedTime: Int = 0,
        val instrumentId: String = "piano",
        val notificationTokens: List<String> = listOf(),
)