extends Area2D

func _on_WindUpdraft_body_entered(body):
	if body.name == "Player":
		body.insideWind = true;
	pass # Replace with function body.

func _on_WindUpdraft_body_exited(body):
	if body.name == "Player":
		body.insideWind = false;
	pass # Replace with function body.




