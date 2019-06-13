extends CanvasLayer

onready var character_name = $textbox/char_name
onready var line = $textbox/dialogue
onready var other_char = $other_character

var josh = true
var npc = true
var clicks = 0
var full_clicks = 0
var event_queue = []

func _ready():
	$player.play("fade")
	get_parent().pause_mode = true
	get_parent().get_parent().pause_mode = true
	$textbox.visible = false
	$Josh.visible = false
	$time_bar.visible = false
	set_process(true)
	pass # Replace with function body.

func _process(delta):
	if delta:
		if $Timer.time_left <= 0:
			global.goto_scene("res://scenes/game_over.tscn")
	pass

func _input(event):
	if event.is_action_pressed("left_click"):
		clicks += 1
		write_component()
	pass

func write(char_name, text_str = null, char_pict = null):
	if char_name == "Josh":
		josh = true
		npc = false
	else:
		josh = false
		npc = true
	
	if text_str == null:
		text_str = char_name
		char_name = ""
	full_clicks += 1
	event_queue.push_front({"name":char_name,"dialogue":text_str,"josh":josh,"npc":npc,"char_pic":char_pict})
	pass

func write_component():
	if clicks > full_clicks - 1:
		$Timer.start()
		other_char.visible = false
		$textbox.visible = false
		$Josh.visible = false
		$time_bar.visible = true
		get_tree().paused = false
	else:
		character_name.clear()
		line.clear()
		if event_queue[event_queue.size() - 1]["npc"]:
			other_char.visible = event_queue[event_queue.size() - 1]["npc"]
			$Josh.visible = event_queue[event_queue.size() - 1]["josh"]
			other_char.texture = load(event_queue[event_queue.size() - 1]["char_pic"])
		else:
			other_char.visible = event_queue[event_queue.size() - 1]["npc"]
			$Josh.visible = event_queue[event_queue.size() - 1]["josh"]
		character_name.add_text(event_queue[event_queue.size() - 1]["name"])
		line.add_text(event_queue[event_queue.size() - 1]["dialogue"])
		event_queue.pop_back()
	pass


func _on_player_animation_finished(anim_name):
	if anim_name == "fade":
		$textbox.visible = true
		write_component()
	pass # Replace with function body.


func _on_Timer_timeout():
	global.goto_scene("res://scenes/menu.tscn")
	pass # Replace with function body.
