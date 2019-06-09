extends Node

onready var g = get_parent().get_parent()

func _ready():
	if g.get_parent().name == "root" and g.name == "intro":
		g.write("Once upon a time there is guy named Josh.",null,"res://images/panels/intro/panel_1.png")
		g.write("Josh is a musician who went outside for a walk to find an idea for his latest piece.",null,"res://images/panels/intro/panel_1.png")
		g.write("Josh","The weather is nice out there.",null)
		g.write("Then Josh meets this sketchy looking bald man.",null,null)
		g.write("The Bald Man","Hello.","res://images/panels/intro/panel_2.png")
		g.write("Josh","Yes, can I help you?","res://images/panels/intro/panel_2.png")
		g.write("The Bald Man","Yes, I have somethin to tell you. Can you come closer to me?.",null)
		g.write("Josh","Why?",null)
		g.write("The Bald Man","Just trust me.",null)
		g.write("Josh comes closer to this man.",null,null)
		g.write("But someone knocks him out.",null,null)
		g.write("Ext. Mysterious Building - 100 minutes later",null,"res://images/panels/intro/panel_3.png")
		g.write("Nobody knew where Josh disappeared.",null,"res://images/panels/intro/panel_3.png")
		g.write("Then inside the room 100.",null,null)
		g.write("Josh","Ugh, where am I?","res://images/panels/intro/panel_6.png")
		g.write("He looks at the brick wall. There is no window to the outside",null,"res://images/panels/intro/panel_4.png")
		g.write("Josh","What? I am locked up in this room?","res://images/panels/intro/panel_4.png")
		g.write("Then he hears a sound from the intercom on the ceiling.",null,null)
		g.write("Intercom",".....","res://images/panels/intro/panel_5.png")
		g.write("Intercom","Testing... testing...","res://images/panels/intro/panel_5.png")
	pass # Replace with function body.
