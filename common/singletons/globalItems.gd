extends Node


enum ID {
	   POSTIT,
		PAPER,
		BEDROOM_KEY
	}

var itemList={

	ID.POSTIT:{
		"inventory":"postit"
	},
	ID.PAPER:{
		"inventory":"paper"
	},
	ID.BEDROOM_KEY:{
		"inventory":"bedroom_key"
	}
		
}


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func getItem(id_):
	return itemList[id_]
	
func getInventoryNameById(id_):
	return itemList.get(id_).inventory

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
