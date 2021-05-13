extends StaticBody

var defaultProps={}
var props={}

var infoPanel=null

enum {OPENED,CLOSED}

var item=null
var scene=null
var object=null

func init(scene_,object_,item_=null):
	scene=scene_
	object=object_
	
	defaultProps.item=item_

	props=GlobalRoom.getStateForRoomOr(scene,object,defaultProps)
	
	infoPanel=$info
	hideInfo()
	
	refreshItem()
	
	refreshState()

func saveProps():
	GlobalRoom.saveStateForObject(scene,object,props)

func canRetrieveItem():
	if props.state==OPENED and props.item!=null:
		return true
	else:
		return false

func setItem(item_):
	props.item=item_
	refreshItem()

func getItem():
	var itemToRetrieve=props.item

	resetItem()
	saveProps()

	refreshItem()
	displayInfo()

	return itemToRetrieve

func resetItem():
	props.item=null

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

func refreshItem():
	#to be implemented in child class
	pass
	
func refreshState():
	#to be implemented in child class
	pass
