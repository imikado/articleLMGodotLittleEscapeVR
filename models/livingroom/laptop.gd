extends "res://common/abstracts/furniture.gd"


func _ready():
	defaultProps={
		"state":CLOSED
	}
	
func refreshState():
	if props.state==OPENED:
		switchOnScreen()
		
func resetScreens():
	$screenOff.visible=false
	$screenOn.visible=false

func switchOnScreen():
	resetScreens()
	$screenOn.visible=true
	
func switchOffScreen():
	resetScreens()
	$screenOff.visible=true
	
func displayInfo():
	if props.state==CLOSED:
		showInfo("Voulez-vous allumer l'ordinateur ?")
	else:
		showInfo("Voulez-vous éteindre l'ordinateur ?")


func action():
	if props.state==CLOSED:
		switchOnScreen()
		
		props.state=OPENED
	else:
		switchOffScreen()
		
		props.state=CLOSED
	
	saveProps()
		
	displayInfo()
