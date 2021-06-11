extends "res://common/abstracts/door.gd"



func _ready():
	defaultProps={
		"state":CLOSED
	}
	
func refreshState():
	if props.state==OPENED:
		openDoor()
	
func openDoor():
	$door.open()

func closeDoor():
	$door.close()
	

func displayInfo():
	if props.state==CLOSED:
		showInfo("Voulez-vous l'ouvrir ?")
	else:
		showInfo("Voulez-vous la fermer ?")


func action():
	hideInfo()
	if props.state==CLOSED:
		if props.locked:
			
			if hasKey():
				props.locked=false
				saveProps()
				
				showInfo("Votre clef a ouvert la porte")
			else:
				showInfo("Elle semble fermé à clef")
		else:
			openDoor()
			
			props.state=OPENED
	else:
		closeDoor()
		
		props.state=CLOSED
	
	saveProps()
		

