extends Spatial

var room='bathroom'

signal gotoBathroomSecretBoxZoom


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	
	$cabinet.init(room,"cabinet")
	
	$secretBoxWithCode.init(room,"secretBoxWithCode",GlobalItems.ID.KITCHEN_KEY)
	
	pass # Replace with function body.




func _on_cabinet_openHotWater():
	$mirror.showHotWater()


func _on_cabinet_closeHotWater():
	$mirror.hideHotWater()



func _on_secretBoxWithCode_gotoSecretBoxZoom():
	emit_signal("gotoBathroomSecretBoxZoom")
	pass # Replace with function body.
