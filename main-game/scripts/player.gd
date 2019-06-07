extends KinematicBody2D

export (int) var speed = 100

var velocity = Vector2()

func _ready():
	pass # Replace with function body.

func get_input():
	velocity = Vector2()
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
		$animation.play("move_right")
	else:
		$animation.play("idle_right")
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
		$animation.play("move_left")
	else:
		$animation.play("idle_left")
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
		$animation.play("move_down")
	else:
		$animation.play("idle_down")
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1
		$animation.play("move_up")
	else:
		$animation.play("move_up")
	
	velocity = velocity.normalized() * speed
	pass

func _physics_process(delta):
	if delta:
		get_input()
		velocity = move_and_slide(velocity)
	pass