extends Node

var itemList=[]
var savedPosition=Vector3.ZERO
var savedCameraPosition=Vector3.ZERO

#items
func addItem(item_):
	itemList.append(item_)

func getItemList():
	return itemList
	
func removeItem(item_):
	pass
	
func hasItem(id_):
	return itemList.has(id_)

#positions
func savePosition(position_):
	savedPosition=position_

func shouldLoadPosition():
	if savedPosition!=Vector3.ZERO:
		return true
	return false

func getPosition():
	return savedPosition
	
func saveCameraPosition(position_):
	savedCameraPosition=position_

func getCameraPosition():
	return savedCameraPosition
