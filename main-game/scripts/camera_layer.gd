extends CanvasLayer

var josh = true
var clicks = 0

func _ready():
	$player.play("fade")
	get_parent().pause_mode = true
	get_parent().get_parent().pause_mode = true
	$textbox.visible = false
	$Josh.visible = false
	pass # Replace with function body.

func _input(event):
	if event.is_action_pressed("left_click"):
		clicks += 1
		write_component()
	pass

func write(char_name, text_str = null, char_pict = null):
	if char_name == "Josh":
		josh = true
	pass

func write_component():
	
	pass


func _on_player_animation_finished(anim_name):
	if anim_name == "fade":
		$textbox.visible = true
		write_component()
	pass # Replace with function body.
