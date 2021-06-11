extends "res://common/abstracts/furniture.gd"

func _ready():
	defaultProps={
		"state":CLOSED
	}
	
func refreshState():
	if props.state==OPENED:
		openDrawer()
		
func refreshItem():
	$drawer/paper.visible=false
	$drawer/postit.visible=false
	
	if props.item==GlobalItems.ID.PAPER:
		$drawer/paper.visible=true
	if props.item==GlobalItems.ID.POSTIT:	
		$drawer/postit.visible=true
		
func openDrawer():
	$drawer.open()

func closeDrawer():
	$drawer.close()

func displayInfo():
	if props.state==CLOSED:
		showInfo("Voulez-vous l'ouvrir ?")
	else:
		if props.item==GlobalItems.ID.BEDROOM_KEY:
			showInfo("Voulez-vous prendre le post-it ?")
		else:
			showInfo("Voulez-vous la fermer ?")


func action():
	if props.state==CLOSED:
		openDrawer()
		
		props.state=OPENED
	else:
		closeDrawer()
		
		props.state=CLOSED
	
	saveProps()
		
	displayInfo()
