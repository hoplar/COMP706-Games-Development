extends KinematicBody2D

export(String, FILE, "*.tscn") var world_scene
export var move_speed = 0.5
export var move_distance = 100.0
export var move_direction = Vector2(0,0)
var time_since = 0
var origin = Vector2(0,0)


onready var player = get_node("/root/World1/Player")


func _ready():
	time_since = 0.0
	origin = position

func _physics_process(delta):
	var position_on_curve2 = sin(time_since * PI * move_speed)
	time_since = time_since + delta
	var position_on_curve = sin(time_since * PI * move_speed)
	var offset = move_distance * position_on_curve * move_direction

	position = origin + offset
	if position_on_curve2 > position_on_curve:
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
	
