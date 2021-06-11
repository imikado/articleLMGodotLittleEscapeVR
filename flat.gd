extends Spatial

var room="flat"


# Called when the node enters the scene tree for the first time.
func _ready():
	
	if GlobalPlayer.shouldLoadPosition():
		$Player.global_transform.origin=GlobalPlayer.getPosition()
		
		$Player.loadCameraPosition(GlobalPlayer.getCameraPosition())
	
	$sky.visible=true
	
	$doors/bedroom/door.init(room,"bedroom_door",true,GlobalItems.ID.BEDROOM_KEY)
	


func gotToInventory():
	get_tree().change_scene("res://ui/inventory.tscn")


func _on_Player_gotoInventory():
	savePlayerPosition()
	gotToInventory()


func _on_bedroom_gotoClosetZoom():
	savePlayerPosition()
	get_tree().change_scene("res://zooms/bedroom_closet.tscn")

func savePlayerPosition():
	GlobalPlayer.savePosition($Player.global_transform.origin)
	GlobalPlayer.saveCameraPosition($Player.getCameraPosition())


func _on_livingroom_gotoChessBoardZoom():
	savePlayerPosition()
	get_tree().change_scene("res://zooms/livingroom_chessBoard.tscn")


func _on_livingroom_gotoRemoteControlZoom():
	savePlayerPosition()
	pass # Replace with function body.
