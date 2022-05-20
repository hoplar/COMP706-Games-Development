extends KinematicBody2D

var _timer = null
export(String, FILE, "*.tscn") var world_scene
const MOVE_SPEED = 130
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


onready var player = get_node("/root/World2/Player")
var motion = Vector2()
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass



func _physics_process(delta):
	if player:
		var direction = (player.position - position).normalized()
		motion = move_and_slide(direction * MOVE_SPEED)
		if motion.x < 0:
			$Sprite.flip_h = true
		else:
			$Sprite.flip_h = false
			
			
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _on_Area2D_body_entered(body):
		if body.name == "Player":
			$Sprite.visible = false
			PlayerTransition._playerDie(world_scene)
	
