extends "res://common/abstracts/furniture.gd"

signal gotoChessBoardZoom


func _ready():
	defaultProps={
		"state":CLOSED,
	}



func displayInfo():
	showInfo("Voulez-vous voir\n le jeu d'echec ?")

func disableInfo():
	$info.visible=false

func action():
	
	emit_signal("gotoChessBoardZoom")
	#saveProps()
		
	displayInfo()	
