extends Node2D

# 5_room.gd

#onready var clock = $player/camera/camera_layer/Timer

# Called when the node enters the scene tree for the first time.
func _ready():
	$other_sprites/door/sound.play()
	set_process(true)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if delta:
		if !$music.playing:
			$music.play()
	pass


func _on_Area2D_body_entered(body):
	if body.name == "player":
		global.goto_scene("res://scenes/game_over.tscn")
	pass # Replace with function body.
