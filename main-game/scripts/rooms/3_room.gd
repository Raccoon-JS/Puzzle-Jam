extends Node2D

# 3_room.gd

onready var time_text = $player/camera/camera_layer/time_bar/time
onready var q_access = $player/camera/camera_layer/question
onready var clock = $player/camera/camera_layer/Timer

var question = preload("res://scenes/questions/question_3.tscn")
var q_enter = false
var q_mode = false
var open_door = false
var change_mode = false
var on = false
var tile = 0
var tile_1 = false
var tile_2 = false
var time_left

# Called when the node enters the scene tree for the first time.
func _ready():
	clock.set("wait_time",100)
	get_tree().paused = true
	set_process(true)
	pass # Replace with function body.

func _input(event):
	var q = question.instance()
	if q_enter:
		if q_mode == false and q_access.get_child_count() <= 0:
			if event.is_action_pressed("interact"):
				q_access.add_child(q)
		elif q_access.get_child_count() > 0:
			if event.is_action_pressed("interact"):
				q_access.get_child(0).queue_free()
	
	if change_mode:
		if event.is_action_pressed("interact"):
			on = !on
		
		if tile == 1:
			if on:
				$other_sprites/answer_1.modulate = Color(0,0,0,1)
				tile_1 = true
			else:
				$other_sprites/answer_1.modulate = Color(1,1,1,1)
		elif tile == 2:
			if on:
				$other_sprites/answer_2.modulate = Color(0,0,0,1)
				tile_2 = true
			else:
				$other_sprites/answer_1.modulate = Color(1,1,1,1)
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	time_left = clock.time_left
	
	if delta:
		time_text.text = "TIME: " + str(int(time_left))
		
		if tile_1 and tile_2:
			open_door = true
		
		if open_door:
			$other_sprites/door.play("open")
	pass

func _on_answer_1_body_entered(body):
	if body.name == "player":
		change_mode = true
		tile = 1
	pass # Replace with function body.

func _on_answer_1_body_exited(body):
	if body.name == "player":
		change_mode = false
		tile = 0
	pass # Replace with function body.

func _on_answer_2_body_entered(body):
	if body.name == "player":
		change_mode = true
		tile = 2
	pass # Replace with function body.

func _on_answer_2_body_exited(body):
	if body.name == "player":
		change_mode = false
		tile = 0
	pass # Replace with function body.

func _on_Area2D_body_entered(body):
	if body.name == "player":
		if open_door:
			global.goto_scene("res://scenes/rooms/5_room.tscn")
	pass # Replace with function body.
