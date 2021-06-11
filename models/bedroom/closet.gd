extends "res://common/abstracts/furniture.gd"


signal gotoClosetZoom

func _ready():
	defaultProps={
		"state":CLOSED,
		"locked":true
	}
	
func zoom():
	$info.visible=false
	
func goUp():
	$doorLeft/padlock.goUp()

func goDown():
	$doorLeft/padlock.goDown()

func goLeft():
	$doorLeft/padlock.goLeft()

func goRight():
	$doorLeft/padlock.goRight()
	
func isSecretCode():
	return $doorLeft/padlock.isCodeCorrect()

func unlock():
	props.locked=false
	$doorLeft/padlock.open()
	saveProps()
	
func isLocked():
	return props.locked

	
func refreshState():
	if props.state==OPENED:
		openDoors()
	if props.locked==false:
		$doorLeft/padlock.open()
		
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
		showInfo("Voulez-vous ouvrir ?")
	else:
		if props.item==GlobalItems.ID.BEDROOM_KEY:
			showInfo("Voulez-vous prendre la clé ?")
		else:
			showInfo("Voulez-vous la fermer ?")


func action():
	if props.state==CLOSED:
		
		if props.locked:
			
			emit_signal("gotoClosetZoom")
		else:
			openDoors()
			
			props.state=OPENED
	else:
		closeDoors()
		
		props.state=CLOSED
	
	saveProps()
		
	displayInfo()
