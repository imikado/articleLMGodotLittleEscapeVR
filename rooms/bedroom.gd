extends Spatial

var room="bedroom"

signal gotoClosetZoom

func _ready():
	
	$closet.init(room,"closet",GlobalItems.ID.BEDROOM_KEY)
	
	$cabinetBedDrawer.init(room,"cabinetBedDrawer",GlobalItems.ID.POSTIT)
	$cabinetBedDrawer2.init(room,"cabinetBedDrawer2",GlobalItems.ID.PAPER)


func _on_closet_gotoClosetZoom():
	emit_signal("gotoClosetZoom")
	pass # Replace with function body.
