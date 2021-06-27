extends Spatial


var room='kitchen'

signal gotoKitchenSecretBoxZoom

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	
	$cabinetDrawer2/secretBoxWithCode.init(room,"secretBox",GlobalItems.ID.EXIT_KEY)
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_secretBoxWithCode_gotoSecretBoxZoom():
	emit_signal("gotoKitchenSecretBoxZoom")
	pass # Replace with function body.
