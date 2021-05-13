extends Spatial

var room="bedroom"

func _ready():
	
	$closet.init(room,"closet",GlobalItems.ID.BEDROOM_KEY)
	
