extends Node

func _ready():
	
	pass

func _process(delta):
	#$Tween.interpolate_property("modulate",$Tween,Color(1,1,1,1),Color(1,1,1,0),1,Tween.TRANS_EXPO,Tween.EASE_IN,1)
	if delta:
		if Input.is_key_pressed(KEY_1):
			#$Tween.start()
			$player.play("fade")
			
		if Input.is_key_pressed(KEY_2):
			get_tree().quit()
	pass




func _on_player_animation_finished(anim_name):
	if anim_name:
		global.goto_scene("res://scenes/menu.tscn")
	pass # Replace with function body.
