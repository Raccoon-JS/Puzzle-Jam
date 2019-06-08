extends Node

onready var c = get_parent().get_parent()
onready var setting = c.get_parent().get_parent().get_parent()

# Called when the node enters the scene tree for the first time.
func _ready():
	if setting.name == "1_room":
		print("hey")
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
