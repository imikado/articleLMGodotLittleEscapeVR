extends "res://common/abstracts/furniture.gd"

signal openHotWater
signal closeHotWater

func _ready():
	defaultProps={
		"state":CLOSED
	}
	
func refreshState():
	if props.state==OPENED:
		openTap()
		
		
func openTap():
	emit_signal("openHotWater")
	
func closeTap():
	emit_signal("closeHotWater")
	
func displayInfo():
	if props.state==CLOSED:
		showInfo("Voulez-vous ouvrir le robinet d'eau chaude ?")
	else:
		showInfo("Voulez-vous fermer le robinet d'eau chaude ?")


func action():
	if props.state==CLOSED:
		openTap()
		
		props.state=OPENED
	else:
		closeTap()
		
		props.state=CLOSED
	
	saveProps()
		
	displayInfo()
