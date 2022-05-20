extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var music = load("res://Music/8-Bit March - Twin Musicom.mp3")
var death = load("res://Music/mixkit-cinematic-glitch-trailer-1021.mp3")
var bounce = load("res://Music/Dodge Ball Bounce-[AudioTrimmer.com] (1) (1).mp3")
var pie = load("res://Music/collect.mp3")


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func play_effect(effect):
	$Effects.stream = effect
	$Effects.play()
	
func play_effect2(effect):
	$Effects2.stream = effect
	$Effects2.play()

func play_music():
	$Music.stream = music
	$Music.play()

func stop_music():
	$Music.stop()
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
