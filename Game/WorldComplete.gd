#WorldComplete.gd
extends Area2D
export(String, FILE, "*.tscn") var world_scene_next
export(String, FILE, "*.tscn") var world_scene

func _on_WorldComplete_body_entered(body):
	if body.name == "Player":
		if PlayerTransition.pieCount == 4:
			PlayerTransition._playerDie(world_scene_next)
		else:
			PlayerTransition._playerDie(world_scene)
	pass # Replace with function body.
