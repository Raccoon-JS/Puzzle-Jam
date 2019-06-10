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
	$button_100/start.visible = false
	$button_100/about.visible = false
	$button_100/quit.visible = false
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
	$button_100/start.text = "100"
	pass # Replace with function body.

func _on_start_button_mouse_exited():
	reverse_change()
	$button_100/start.text = "START"
	pass # Replace with function body.

# About Button Color Change
func _on_about_button_mouse_entered():
	change_black()
	$button_100/about.text = "100"
	pass # Replace with function body.

func _on_about_button_mouse_exited():
	reverse_change()
	$button_100/about.text = "ABOUT"
	pass # Replace with function body.

# Quit Button Color Change
func _on_quit_button_mouse_entered():
	change_black()
	$button_100/quit.text = "100"
	pass # Replace with function body.

func _on_quit_button_mouse_exited():
	reverse_change()
	$button_100/quit.text = "QUIT"
	pass # Replace with function body.

func _on_player_animation_finished(anim_name):
	if anim_name == "sucked_into_tv":
		global.goto_scene("res://scenes/intro.tscn")
	pass # Replace with function body.
