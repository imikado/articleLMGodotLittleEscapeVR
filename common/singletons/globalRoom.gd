extends Node2D


var roomsData={}

func getKey(room_,object_):
	return room_+'___'+object_

func saveStateForObject(room_,object_,value_):
	roomsData[ getKey(room_,object_) ]=value_

func getStateForRoomOr(room_,object_,default_):
	if hasStateForRoom(room_,object_):
		return roomsData[ getKey(room_,object_) ]
	return default_

func hasStateForRoom(room_,object_):
	if roomsData.has( getKey(room_,object_) ):
		return true
	return false
