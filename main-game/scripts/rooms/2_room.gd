extends Node2D

# 2_room.gd

var letters = ['A','B','C','D','E','F','G']
var default = ['A','0','0','0','0','0','0','0','0']
var numbers = [false,false,false,false,false,false,false,false]
var num = [0,0,0,0,0,0,0,0]
var correct_answer = ['C','0','1','0','0','0','0','1','1']
var change_num = false
var num_type = 0
var question = preload("res://scenes/questions/question_2.tscn")
var q_enter = false
var q_mode = false
var open_door = false
var change_mode = false
var time_left
var l = 0

onready var time_text = $player/camera/camera_layer/time_bar/time
onready var q_access = $player/camera/camera_layer/question
onready var clock = $player/camera/camera_layer/Timer

# Called when the node enters the scene tree for the first time.
func _ready():
	clock.set("wait_time",100)
	$other_sprites/answer_1/Sprite/label.text = default[0]
	$other_sprites/answer_2/Sprite/label.text = default[1]
	$other_sprites/answer_3/Sprite/label.text = default[2]
	$other_sprites/answer_4/Sprite/label.text = default[3]
	$other_sprites/answer_5/Sprite/label.text = default[4]
	$other_sprites/answer_6/Sprite/label.text = default[5]
	$other_sprites/answer_7/Sprite/label.text = default[6]
	$other_sprites/answer_8/Sprite/label.text = default[7]
	$other_sprites/answer_9/Sprite/label.text = default[8]
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
			l += 1
	if change_num:
		if event.is_action_pressed("interact"):
			numbers[num_type] = !numbers[num_type]
			if numbers[num_type]:
				num[num_type] = 1
			else:
				num[num_type] = 0
	
	if event.is_action_pressed("interact"):
		$other_sprites/sound_effect.play()
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	time_left = clock.time_left
	
	if delta:
		if !$music.playing:
			$music.play()
		
		time_text.text = "TIME: " + str(int(time_left))
		
		if l > letters.size() - 1:
			l = 0
		
		$other_sprites/answer_1/Sprite/label.text = letters[l]
		
		match(num_type):
			0:
				$other_sprites/answer_2/Sprite/label.text = str(num[num_type])
			1:
				$other_sprites/answer_3/Sprite/label.text = str(num[num_type])
			2:
				$other_sprites/answer_4/Sprite/label.text = str(num[num_type])
			3:
				$other_sprites/answer_5/Sprite/label.text = str(num[num_type])
			4:
				$other_sprites/answer_6/Sprite/label.text = str(num[num_type])
			5:
				$other_sprites/answer_7/Sprite/label.text = str(num[num_type])
			6:
				$other_sprites/answer_8/Sprite/label.text = str(num[num_type])
			7:
				$other_sprites/answer_9/Sprite/label.text = str(num[num_type])
		var answer = []
		answer.append(letters[l])
		for i in 8:
			answer.append(str(num[i]))
		var k = 0
		for j in 9:
			if answer[j] == correct_answer[j]:
				k += 1
			else:
				k = 0
		if k == correct_answer.size():
			open_door = true
		else:
			open_door = false
			answer.clear()
		
		if open_door:
			$other_sprites/door.play("open")
			#$other_sprites/door/sound.play()
	pass


func _on_puzzle_description_body_entered(body):
	if body.name == "player":
		q_enter = true
	pass # Replace with function body.

func _on_answer_1_body_entered(body):
	if body.name == "player":
		change_mode = true
		#$other_sprites/answer_1/Sprite/label.text = letters[l]
	pass # Replace with function body.

func _on_answer_1_body_exited(body):
	if body.name == "player":
		change_mode = false
	pass # Replace with function body.


func _on_answer_2_body_entered(body):
	if body.name == "player":
		change_num = true
		num_type = 0
	pass # Replace with function body.

func _on_answer_2_body_exited(body):
	if body.name == "player":
		change_num = false
		num_type = 0
	pass # Replace with function body.


func _on_answer_3_body_entered(body):
	if body.name == "player":
		change_num = true
		num_type = 1
	pass # Replace with function body.


func _on_answer_3_body_exited(body):
	if body.name == "player":
		change_num = false
		num_type = 1
	pass # Replace with function body.


func _on_answer_4_body_entered(body):
	if body.name == "player":
		change_num = true
		num_type = 2
	pass # Replace with function body.


func _on_answer_4_body_exited(body):
	if body.name == "player":
		change_num = true
		num_type = 2
	pass # Replace with function body.


func _on_answer_5_body_entered(body):
	if body.name == "player":
		change_num = true
		num_type = 3
	pass # Replace with function body.


func _on_answer_5_body_exited(body):
	if body.name == "player":
		change_num = true
		num_type = 3
	pass # Replace with function body.


func _on_answer_6_body_entered(body):
	if body.name == "player":
		change_num = true
		num_type = 4
	pass # Replace with function body.


func _on_answer_6_body_exited(body):
	if body.name == "player":
		change_num = true
		num_type = 4
	pass # Replace with function body.


func _on_answer_7_body_entered(body):
	if body.name == "player":
		change_num = true
		num_type = 5
	pass # Replace with function body.


func _on_answer_7_body_exited(body):
	if body.name == "player":
		change_num = true
		num_type = 5
	pass # Replace with function body.


func _on_answer_8_body_entered(body):
	if body.name == "player":
		change_num = true
		num_type = 6
	pass # Replace with function body.


func _on_answer_8_body_exited(body):
	if body.name == "player":
		change_num = true
		num_type = 6
	pass # Replace with function body.


func _on_answer_9_body_entered(body):
	if body.name == "player":
		change_num = true
		num_type = 7
	pass # Replace with function body.


func _on_answer_9_body_exited(body):
	if body.name == "player":
		change_num = true
		num_type = 7
	pass # Replace with function body.

func _on_open_door_body_entered(body):
	if body.name == "player":
		if open_door:
			global.goto_scene("res://scenes/rooms/3_room.tscn")
	pass # Replace with function body.


func _on_puzzle_description_body_exited(body):
	if body.name == "player":
		q_enter = false
	pass # Replace with function body.
