extends Area2D

var x = 1
var _timer = null

func _ready() -> void:
	_timer = Timer.new()
	add_child(_timer)
	_timer.connect("timeout", self, "_on_Timer_timeout")
	_timer.set_wait_time(0.01)
	_timer.set_one_shot(false)
	pass


func _on_BloonBoi_body_entered(body):
	
	if body.name == "Player":
		MusicController.play_effect(MusicController.bounce)
		body.motion.y = -500
		_timer.set_wait_time(0.3)
		_timer.start()
		x = 2
	
	pass # Replace with function body.


func _on_Timer_timeout() -> void:	
	
	
		if x == 1:
			self.visible = true
			$CollisionShape2D.disabled = false
			$Sprite.modulate.a = 1
			pass
		
		elif x == 2:
			$Sprite.modulate.a = 0.5
			$CollisionShape2D.disabled = true
			_timer.set_wait_time(0.3)
			_timer.set_one_shot(false)
			_timer.start()
			x += 1
			pass
			
		elif x == 3:
			self.visible = false
			_timer.set_wait_time(3.0)
			_timer.set_one_shot(false)
			_timer.start()
			x -= 2
			pass
