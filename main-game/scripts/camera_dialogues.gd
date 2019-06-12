extends Node

onready var c = get_parent().get_parent()
onready var setting = c.get_parent().get_parent().get_parent()

# Called when the node enters the scene tree for the first time.
func _ready():
	var room_name = setting.name
	match(room_name):
		"1_room":
			c.write("Josh","Who is this?",null)
			c.write("Intercom","No need to ask that question.","res://images/cirgarette_man_sillouette.png")
			c.write("Intercom","The time is 1 AM. You are in the core center of Room 100 and 100th floor of this building.","res://images/cirgarette_man_sillouette.png")
			c.write("Intercom","And you have 100 seconds to get out of here.","res://images/cirgarette_man_sillouette.png")
			c.write("Josh","What?",null)
			c.write("Intercom","Yes. But if you want to make it alive, take the hint very seriously.","res://images/cirgarette_man_sillouette.png")
			c.write("Intercom","WASD is a movement. E is interact. ESC is pause (go ahead and pause the time).","res://images/cirgarette_man_sillouette.png")
			c.write("Josh","What is this, a game?",null)
			c.write("Josh","I guess I have to move with WASD keys and press E to sEE the question on the wall.",null)
		"2_room":
			c.write("Josh","This one is a lot more bigger.",null)
			c.write("Intercom","You still need to solve to survive.","res://images/cirgarette_man_sillouette.png")
			c.write("Intercom","But don't worry, I maxed out the 100 seconds time limit.","res://images/cirgarette_man_sillouette.png")
		"3_room":
			c.write("Josh","This room looks almost exactly the same. And it even shares the exact same size!",null)
			c.write("Intercom","Eh, I was lazy. But this one is a lot harder!","es://images/cirgarette_man_sillouette.png")
		"4_room":
			c.write("Intercom","Do you see the goat over there?","res://images/cirgarette_man_sillouette.png")
			c.write("Josh","A goat?",null)
			c.write("Goat","Hey there!","res://images/goat.png")
			c.write("Josh","And it talks!",null)
			c.write("Goat","Wanna play Battletoads?","res://images/goat.png")
		"5_room":
			c.write("Intercom","This is the last layer.","res://images/cirgarette_man_sillouette.png")
			c.write("Josh","the last layer?",null)
		_:
			c.write("Josh","Nothing.",null)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
