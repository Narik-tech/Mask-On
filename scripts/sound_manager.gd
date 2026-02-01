extends Node

const JUMP  := preload("res://sound/player_jump_2.mp3")
const SLIDE := preload("res://sound/slide.wav")
const WOOSH := preload("res://sound/woosh.wav")

const BUS := "SFX"

func _play(stream: AudioStream) -> void:
	var p := AudioStreamPlayer.new()
	p.stream = stream
	p.bus = BUS
	add_child(p)
	p.play()
	p.finished.connect(p.queue_free)

func jump() -> void:
	_play(JUMP)

func slide() -> void:
	_play(SLIDE)

func woosh() -> void:
	_play(WOOSH)
