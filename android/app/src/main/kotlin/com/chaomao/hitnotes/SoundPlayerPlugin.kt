package com.chaomao.hitnotes

import android.media.AudioAttributes
import android.media.AudioManager
import android.media.SoundPool
import android.os.Build
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel

class SoundPlayerPlugin : MethodChannel.MethodCallHandler {
    private lateinit var soundPool: SoundPool
    private val loadingSounds = hashMapOf<Int, MethodChannel.Result>()

    override fun onMethodCall(methodCall: MethodCall, result: MethodChannel.Result) {
        when (methodCall.method) {
            "init" -> {
                val arguments = methodCall.arguments as Map<String, Any>
                val streamTypeIndex = arguments["streamType"] as Int
                val maxStreams = arguments["maxStreams"] as Int
                val streamType = when (streamTypeIndex) {
                    0 -> AudioManager.STREAM_RING
                    1 -> AudioManager.STREAM_ALARM
                    2 -> AudioManager.STREAM_MUSIC
                    3 -> AudioManager.STREAM_NOTIFICATION
                    else -> -1
                }
                if (streamType > -1) {
                    soundPool = if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
                        val usage = when (streamType) {
                            AudioManager.STREAM_RING -> AudioAttributes.USAGE_NOTIFICATION_RINGTONE
                            AudioManager.STREAM_ALARM -> AudioAttributes.USAGE_ALARM
                            AudioManager.STREAM_NOTIFICATION -> AudioAttributes.USAGE_NOTIFICATION
                            else -> AudioAttributes.USAGE_GAME
                        }
                        SoundPool.Builder()
                                .setMaxStreams(maxStreams)
                                .setAudioAttributes(AudioAttributes.Builder().setLegacyStreamType
                                (streamType)
                                        .setUsage(usage)
                                        .build())
                                .build()
                    } else {
                        SoundPool(maxStreams, streamType, 1)
                    }.apply {
                        setOnLoadCompleteListener { _, sampleId, status ->
                            val resultCallback = loadingSounds[sampleId]
                            resultCallback?.let {
                                if (status == 0) {
                                    it.success(sampleId)
                                } else {
                                    it.error("Loading failed", "Error code: $status", null)
                                }
                                loadingSounds.remove(sampleId)
                            }
                        }
                    }
                    result.success(null)
                } else {
                    result.error("Init failed", null, null)
                }
            }
            "load" -> {
                val arguments = methodCall.arguments as Map<String, Any>
                val path = arguments["path"] as String
                val priority = arguments["priority"] as Int
                val soundId = soundPool.load(path, priority)
                if (soundId > -1) {
                    loadingSounds[soundId] = result
                } else {
                    result.success(soundId)
                }
            }
            "play" -> {
                val arguments = methodCall.arguments as Map<String, Any>
                val soundId = arguments["soundId"] as Int
                val repeat = arguments["repeat"] as Int
                val rate = arguments["rate"] as Double
                val streamId = soundPool.play(soundId, 1.0f, 1.0f, 0,
                        repeat, rate.toFloat())
                result.success(streamId)
            }
            "stop" -> {
                val arguments = methodCall.arguments as Map<String, Int>
                val streamId = arguments["streamId"] as Int
                soundPool.stop(streamId)
                result.success(streamId)
            }
            "release" -> {
                soundPool.release()
                result.success(null)
            }
            else -> {
                result.notImplemented()
            }
        }
    }
}