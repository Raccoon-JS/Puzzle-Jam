extends Node

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Pressing
func _on_return_pressed():
	global.goto_scene("res://scenes/menu.tscn")
	pass # Replace with function body.

func _on_licenses_pressed():
	global.goto_scene("res://scenes/licenses.tscn")
	pass # Replace with function body.

# Entered
func _on_return_mouse_entered():
	$background.color = Color(0,0,0,1)
	$title.add_color_override("font_color", Color(1,1,1,1))
	$description.add_color_override("default_color", Color(1,1,1,1))
	$buttons/return.add_color_override("font_color", Color(1,1,1,1))
	$buttons/licenses.add_color_override("font_color",Color(1,1,1,1))
	pass # Replace with function body.

func _on_licenses_mouse_entered():
	$background.color = Color(0,0,0,1)
	$title.add_color_override("font_color", Color(1,1,1,1))
	$description.add_color_override("default_color", Color(1,1,1,1))
	$buttons/return.add_color_override("font_color", Color(1,1,1,1))
	$buttons/licenses.add_color_override("font_color",Color(1,1,1,1))
	pass # Replace with function body.

# Exited
func _on_return_mouse_exited():
	$background.color = Color(1,1,1,1)
	$title.add_color_override("font_color", Color(0,0,0,1))
	$description.add_color_override("default_color", Color(0,0,0,1))
	$buttons/return.add_color_override("font_color", Color(0,0,0,1))
	$buttons/licenses.add_color_override("font_color",Color(0,0,0,1))
	pass # Replace with function body.

func _on_licenses_mouse_exited():
	$background.color = Color(1,1,1,1)
	$title.add_color_override("font_color", Color(0,0,0,1))
	$description.add_color_override("default_color", Color(0,0,0,1))
	$buttons/return.add_color_override("font_color", Color(0,0,0,1))
	$buttons/licenses.add_color_override("font_color",Color(0,0,0,1))
	pass # Replace with function body.
