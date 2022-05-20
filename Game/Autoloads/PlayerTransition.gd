extends Node
onready var player
onready var pieCount = 0

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.


func _playerDie(world_scene):
	if world_scene != "res://Main Menu.tscn":
		player.canMove = false
		player.cameraEffect = true
	MusicController.play_effect(MusicController.death)
	yield(get_tree().create_timer(0.5), "timeout")
	get_tree().change_scene(world_scene)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
