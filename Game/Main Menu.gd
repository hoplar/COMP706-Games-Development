extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	MusicController.play_music()
	OS.set_window_position(OS.get_screen_size()*0.5 - OS.get_window_size()*0.5)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_StartButton_pressed():
	get_tree().change_scene("res://World1.tscn")


func _on_QuitButton_pressed():
	get_tree().quit()


func _on_StoryButton_pressed():
	get_tree().change_scene("res://Story Menu.tscn")
	pass # Replace with function body.
