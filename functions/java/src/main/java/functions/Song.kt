package functions

data class Song(
        val id: String = "",
        val title: String = "",
        val artist: String = "",
        val url: String = "",
        val bpm: Int = 0,
        val unitDuration: Int = 0,
        val tilesCount: List<Int> = listOf(),
        val duration: List<Int> = listOf(),
        val tags: List<String> = listOf()
)
