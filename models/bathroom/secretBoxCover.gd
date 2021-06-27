extends MeshInstance


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func open():
	rotate(Vector3(0,0,1),-6)
	pass
	
func close():
	rotate(Vector3(0,0,1),6)
	pass
