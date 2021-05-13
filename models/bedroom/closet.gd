extends "res://common/abstracts/furniture.gd"

func _ready():
	defaultProps={
		"state":CLOSED
	}
	
func refreshState():
	if props.state==OPENED:
		openDoors()
		
func refreshItem():
	$bedroom_key.visible=false
	
	if props.item==GlobalItems.ID.BEDROOM_KEY:
		$bedroom_key.visible=true
		
func openDoors():
	$doorLeft.open()
	$doorRight.open()

func closeDoors():
	$doorLeft.close()
	$doorRight.close()


func displayInfo():
	if props.state==CLOSED:
		showInfo("Ceci est une armoire.\n Voulez-vous l'ouvrir ?")
	else:
		if props.item==GlobalItems.ID.BEDROOM_KEY:
			showInfo("Voulez-vous prendre la clé ?")
		else:
			showInfo("Ceci est une armoire.\n Voulez-vous la fermer ?")


func action():
	if props.state==CLOSED:
		openDoors()
		
		props.state=OPENED
	else:
		closeDoors()
		
		props.state=CLOSED
	
	saveProps()
		
	displayInfo()
