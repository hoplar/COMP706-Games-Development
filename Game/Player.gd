extends KinematicBody2D
# Player Script
const UP = Vector2(0, -1)

onready var RainbowShader = preload("res://Rainbow.tres")
var motion = Vector2()
var insideWind = false
export var max_speed = 200
export var acceleration = 50
export var gravity = 20
export var jump_force = 440
var canMove = true
var cameraEffect = false
var menu = false


func _ready():
	PlayerTransition.pieCount = 0

func _physics_process(delta):
	PlayerTransition.player = self
	$Camera2D/CanvasLayer2/Label.text = "Pies - " + str(PlayerTransition.pieCount) + "/4"
	if PlayerTransition.pieCount == 4:
		$Camera2D/CanvasLayer2/Label.material = RainbowShader
	
	if cameraEffect == false:
		$Camera2D/CanvasLayer/ColorRect.visible = false
	else:
		$Camera2D/CanvasLayer/ColorRect.visible = true
	
	if canMove:
		if insideWind == true:
			motion.y -= 25

			
		motion.y += gravity
		var friction = false
		if Input.is_action_pressed("ui_right"):
			motion.x = min(motion.x + acceleration, max_speed)
			$Sprite.flip_h = false
			$Sprite.play("run")
		elif Input.is_action_pressed("ui_left"):
			motion.x = max(motion.x - acceleration, -max_speed)
			$Sprite.flip_h = true
			$Sprite.play("run")
		else:
			$Sprite.play("idle")
			friction = true

		
		if is_on_floor():
			if Input.is_action_just_pressed("ui_up"):
				motion.y = -jump_force
			if friction == true:
				motion.x = lerp(motion.x, 0, 0.2)
		else:
			if motion.y < 0:
				$Sprite.play("jump")	
			else:
				$Sprite.play("fall")
			if friction == true:
				motion.x = lerp(motion.x, 0, 0.05)
			
		motion = move_and_slide(motion, UP)
	

				
		
	pass

# Called when the node enters the scene tree for the first time.
#func _ready():
# Initialsation of node
#	pass # Replace with function body.

func _input(event):
	#this event is called once per key-press
	if event.is_action_pressed("ui_cancel"):
		if menu == false:
			$Camera2D/CanvasLayerPauseMenu/Label.visible = true
			$Camera2D/CanvasLayerPauseMenu/VBoxContainer.visible = true
			menu = true
			get_tree().paused = true
			canMove = false
		else:
			$Camera2D/CanvasLayerPauseMenu/Label.visible = false
			$Camera2D/CanvasLayerPauseMenu/VBoxContainer.visible = false
			menu = false
			get_tree().paused = false
			canMove = true
					
func _on_Quit_pressed():
	get_tree().change_scene("res://Main Menu.tscn")
	get_tree().paused = false
	pass # Replace with function body.


func _on_Resume_pressed():
	$Camera2D/CanvasLayerPauseMenu/Label.visible = false
	$Camera2D/CanvasLayerPauseMenu/VBoxContainer.visible = false
	menu = false
	get_tree().paused = false
	canMove = true
	pass # Replace with function body.
