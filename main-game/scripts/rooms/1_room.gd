extends Node2D

# 1_room.gd

onready var time_text = $player/camera/camera_layer/time_bar/time
onready var clock = $player/camera/camera_layer/Timer
onready var q_access = $player/camera/camera_layer/question

var question = preload("res://scenes/questions/question_1.tscn")
var q_enter = false
var q_mode = false
var open_door = false

var wrong_answer = false
var right_answer = false

var time_left

func _ready():
	clock.set("wait_time",100)
	$other_sprites/answer_1/Sprite/label.text = str(20)
	$other_sprites/answer_2/Sprite/label.text = str(12)
	get_tree().paused = true
	set_process(true)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _input(event):
	var q = question.instance()
	if q_enter:
		if q_mode == false and q_access.get_child_count() <= 0:
			if event.is_action_pressed("interact"):
				q_access.add_child(q)
		elif q_access.get_child_count() > 0:
			if event.is_action_pressed("interact"):
				q_access.get_child(0).queue_free()
	
	pass

func _process(delta):
	time_left = clock.time_left
	
	if wrong_answer:
		if Input.is_action_just_pressed("interact"):
			clock.pause_mode = true
			time_left -= 20
			if time_left > 0:
				clock.wait_time = time_left
			else:
				global.goto_scene("res://scenes/menu.tscn")
			clock.start()
	
	if right_answer:
		if Input.is_action_just_pressed("interact"):
			open_door = true
			$other_sprites/door.play("open")
	
	if delta:
		time_text.text = "TIME: " + str(int(time_left))
	pass

func _on_puzzle_description_player_entered(body):
	if body.name == "player":
		q_enter = true
	pass # Replace with function body.

func _on_puzzle_description_body_exited(body):
	if body.name == "player":
		q_enter = false
	pass # Replace with function body.

func _on_front_door_body_entered(body):
	if body.name == "player":
		if open_door:
				global.goto_scene("res://scenes/menu.tscn")
	pass # Replace with function body.

func _on_answer_1_body_entered(body):
	if body.name == "player":
		wrong_answer = true
	pass # Replace with function body.

func _on_answer_1_body_exited(body):
	if body.name == "player":
		wrong_answer = false
	pass # Replace with function body.

func _on_answer_2_body_entered(body):
	if body.name == "player":
		right_answer = true
	pass # Replace with function body.

func _on_answer_2_body_exited(body):
	if body.name == "player":
		right_answer = false
	pass # Replace with function body.
