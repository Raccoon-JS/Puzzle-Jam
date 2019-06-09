extends Node

func _ready():
	
	pass # Replace with function body.

func change_black():
	$background/background_color.color = Color(0,0,0,1)
	$background/title.add_color_override("font_color", Color(1,1,1,1))
	pass

func reverse_change():
	$background/background_color.color = Color(1,1,1,1)
	$background/title.add_color_override("font_color", Color(0,0,0,1))
	pass

# Pressed
func _on_start_button_pressed():
	$start.visible = false
	$about.visible = false
	$quit.visible = false
	$player.play("sucked_into_tv")
	pass # Replace with function body.

func _on_about_button_pressed():
	global.goto_scene("res://scenes/about.tscn")
	pass # Replace with function body.

func _on_quit_button_pressed():
	get_tree().quit()
	pass # Replace with function body.

# Start Button Color Change
func _on_start_button_mouse_entered():
	change_black()
	pass # Replace with function body.

func _on_start_button_mouse_exited():
	reverse_change()
	pass # Replace with function body.

# About Button Color Change
func _on_about_button_mouse_entered():
	change_black()
	pass # Replace with function body.

func _on_about_button_mouse_exited():
	reverse_change()
	pass # Replace with function body.

# Quit Button Color Change
func _on_quit_button_mouse_entered():
	change_black()
	pass # Replace with function body.

func _on_quit_button_mouse_exited():
	reverse_change()
	pass # Replace with function body.

func _on_player_animation_finished(anim_name):
	if anim_name == "sucked_into_tv":
		global.goto_scene("res://scenes/intro.tscn")
	pass # Replace with function body.
