extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass



func _on_Pie_body_entered(body):
	if body.name == "Player":
		if self.visible == true:
			PlayerTransition.pieCount += 1
			MusicController.play_effect2(MusicController.pie)
		self.visible = false
		$CollisionShape2D.disabled = true

		pass # Replace with function body.
