extends Node

onready var pic = $picture
onready var text_dialogue = $textbox/dialogue
onready var text_name = $textbox/char_name
onready var story = $story/dialogues

var event_queue = []
var prev_pic = null
var next_pic = null
var clicks = 0 

func _ready():
	story.request_ready()
	write_component()
	pass # Replace with function body.

func _input(event):
	if event.is_action_pressed("left_click"):
		clicks += 1
		write_component()
	pass

func write(char_name, text_str = null, picture = null):
	if text_str == null:
		text_str = char_name
		char_name = ""
	if picture == null:
		next_pic = prev_pic
	else:
		prev_pic = next_pic
		next_pic = picture
	
	event_queue.push_front({"name":char_name, "dialogue": text_str, "picture": next_pic})
	pass

func write_component():
	if clicks > 19:
		global.goto_scene("res://scenes/rooms/1_room.tscn")
	else:
		text_name.clear()
		text_dialogue.clear()
		pic.texture = load(event_queue[event_queue.size() - 1]["picture"])
		text_name.add_text(event_queue[event_queue.size() - 1]["name"])
		text_dialogue.add_text(event_queue[event_queue.size() - 1]["dialogue"])
		event_queue.pop_back()
	pass
