extends KinematicBody2D

const SPEED = 70

var movedir = Vector2(0,0)
var spritedir = "down"

func _physics_process(delta):
	if delta:
		controls_loop()
		movement_loop()
		spritedir_loop()
		
		if movedir != Vector2(0,0):
			anim_switch("move")
		else:
			anim_switch("idle")
	pass

func controls_loop():
	var LEFT = Input.is_action_pressed("move_left")
	var RIGHT = Input.is_action_pressed("move_right")
	var UP = Input.is_action_pressed("move_up")
	var DOWN = Input.is_action_pressed("move_down")
	
	movedir.x = -int(LEFT) + int(RIGHT)
	movedir.y = -int(UP) + int(DOWN)
	
	pass

func movement_loop():
	var motion = movedir.normalized() * SPEED
	motion = move_and_slide(motion, Vector2(0,0))
	pass

func spritedir_loop():
	match movedir:
		Vector2(-1,0):
			spritedir = "left"
		Vector2(1,0):
			spritedir = "right"
		Vector2(0,-1):
			spritedir = "up"
		Vector2(0,1):
			spritedir = "down"
	pass

func anim_switch(animation):
	var newanim = str(animation + "_" + spritedir)
	if $animation.current_animation != newanim:
		$animation.play(newanim)
	pass