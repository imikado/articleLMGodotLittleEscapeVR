extends "res://common/abstracts/furniture.gd"

signal gotoRemoteControlZoom


func _ready():
	defaultProps={
	}



func displayInfo():
	showInfo("Voulez vous voir la télécommande ?")


func action():
	
	emit_signal("gotoRemoteControlZoom")
	#saveProps()
		
	displayInfo()	
