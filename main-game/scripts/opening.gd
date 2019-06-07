extends Node

func _ready():
	$animation.play("fade_logo")
	pass # Replace with function body.


func _on_animation_finished(anim_name):
	if anim_name == "fade_logo":
		$animation.play("white_out")
	pass # Replace with function body.
