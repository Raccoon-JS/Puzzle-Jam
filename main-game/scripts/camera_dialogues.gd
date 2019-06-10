extends Node

onready var c = get_parent().get_parent()
onready var setting = c.get_parent().get_parent().get_parent()

# Called when the node enters the scene tree for the first time.
func _ready():
	if setting.name == "1_room":
		c.write("Josh","Who is this?",null)
		c.write("Intercom","No need to ask that question.","res://images/cirgarette_man_sillouette.png")
		c.write("Intercom","You are in the core center of Room 100 and 100th floor of this building.","res://images/cirgarette_man_sillouette.png")
		c.write("Intercom","And you have 100 seconds to get out of here.","res://images/cirgarette_man_sillouette.png")
		c.write("Josh","What?",null)
		c.write("Intercom","Yes. But if you want to make it alive, take the hint very seriously.","res://images/cirgarette_man_sillouette.png")
		c.write("Intercom","WASD is a movement. E is interact. ESC is pause (go ahead and pause the time).","res://images/cirgarette_man_sillouette.png")
		c.write("Josh","What is this, a game?",null)
		c.write("Josh","I guess I have to move with WASD keys and press E to sEE the question on the wall.",null)
	else:
		c.write("Josh","Nothing",null)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
