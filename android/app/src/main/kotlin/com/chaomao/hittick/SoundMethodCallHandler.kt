package com.chaomao.hittick

import android.media.AudioAttributes
import android.media.AudioManager
import android.media.SoundPool
import android.os.Build
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import kotlin.math.pow

class SoundMethodCallHandler : MethodChannel.MethodCallHandler {
    private lateinit var soundPool: SoundPool
    private var loadedCount = 0
    private var soundIds = mapOf<Int, Int>()
    private var rates = mapOf<Int, Float>()
    private var activeSounds = arrayListOf<Int>()
    private val maxStreams = 8

    override fun onMethodCall(methodCall: MethodCall, result: MethodChannel.Result) {
        when (methodCall.method) {
            "load" -> {
                val arguments = methodCall.arguments as Map<String, Any>
                val soundPaths = arguments["soundPaths"] as Map<Int, String>
                val baseNotes = arguments["baseNotes"] as Map<Int, Int>
                soundPool = if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
                    SoundPool.Builder()
                            .setMaxStreams(maxStreams)
                            .setAudioAttributes(AudioAttributes.Builder().setLegacyStreamType
                            (AudioManager.STREAM_MUSIC)
                                    .setUsage(AudioAttributes.USAGE_GAME)
                                    .build())
                            .build()
                } else {
                    SoundPool(maxStreams, AudioManager.STREAM_MUSIC, 1)
                }.apply {
                    setOnLoadCompleteListener { _, _, _ ->
                        loadedCount++
                        if (loadedCount == soundPaths.size) {
                            result.success(null)
                        }
                    }
                }
                val ids = hashMapOf<Int, Int>()
                for ((baseNote, path) in soundPaths) {
                    val soundId = soundPool.load(path, 1)
                    ids[baseNote] = soundId
                }
                rates = baseNotes.mapValues { 2f.pow((it.key - it.value).toFloat() / 12f) }
                this.soundIds = baseNotes.mapValues { ids[it.value]!! }
            }
            "play" -> {
                val arguments = methodCall.arguments as Map<String, Any>
                val note = arguments["note"] as Int
                val streamId = soundPool.play(soundIds[note]!!, 1.0f, 1.0f, 0,
                        0, rates[note]!!)
                activeSounds.add(streamId)
                if (activeSounds.size > maxStreams) {
                    val firstSound = activeSounds.first()
                    soundPool.stop(firstSound)
                    activeSounds.remove(firstSound)
                }
                result.success(null)
            }
            "release" -> {
                if (this::soundPool.isInitialized) {
                    soundPool.release()
                }
                loadedCount = 0
                activeSounds.clear()
                result.success(null)
            }
            else -> {
                result.notImplemented()
            }
        }
    }
}