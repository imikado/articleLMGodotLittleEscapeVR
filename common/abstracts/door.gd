extends StaticBody

var inverted=false

var defaultProps={}
var props={}

var infoPanel=null


enum {OPENED,CLOSED}

var item=null
var scene=null
var object=null

func init(scene_,object_,inverted_,key_=null):
	scene=scene_
	object=object_

	inverted=inverted_
	
	defaultProps.key=key_

	defaultProps.locked=false

	if key_!=null:
		defaultProps.locked=true

	props=GlobalRoom.getStateForRoomOr(scene,object,defaultProps)

	if inverted==true:
		infoPanel=$info2
		$info.visible=false
	else:
		infoPanel=$info
		$info2.visible=false

	hideInfo()
		
	refreshState()

func hasKey():
	if GlobalPlayer.hasItem(props.key):
		return true
	else:
		return false

func saveProps():
	GlobalRoom.saveStateForObject(scene,object,props)

func setKey(key_):
	props.key=key_

func showInfo(text_):
	if getInfoPanel():
		getInfoPanel().showInfo(text_)

func hideInfo():
	if getInfoPanel():
		getInfoPanel().hideInfo()

func getInfoPanel():
	return infoPanel

func displayInfo():
	#to be implemented in child class
	pass
	
func refreshState():
	#to be implemented in child class
	pass
