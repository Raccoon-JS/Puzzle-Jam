extends Node

func _ready():
	$animation.play("fade_logo")
	pass # Replace with function body.

func _input(event):
	if event.is_action_pressed("left_click") or Input.is_key_pressed(KEY_ENTER):
		global.goto_scene("res://scenes/menu.tscn")
	pass

func _on_animation_finished(anim_name):
	if anim_name == "fade_logo":
		$animation.play("white_out")
	if anim_name == "white_out":
		global.goto_scene("res://scenes/menu.tscn")
	pass # Replace with function body.
