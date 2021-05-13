extends Node

var vrEnabled=false


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func setVrEnabled(bool_):
	vrEnabled=bool_
	
func isVRenabled():
	return vrEnabled


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
