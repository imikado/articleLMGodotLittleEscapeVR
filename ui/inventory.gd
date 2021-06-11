extends Spatial


var speed=3

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	
	var vr_interface=ARVRServer.find_interface("Native mobile")
	if vr_interface and vr_interface.initialize():
		get_viewport().arvr=true
		get_viewport().hdr=false
	
	GlobalPlayer.addItem(GlobalItems.ID.PAPER)
	GlobalPlayer.addItem(GlobalItems.ID.POSTIT)
	
		
	var itemList=GlobalPlayer.getItemList()
	
	for item in $items.get_children():
		item.visible=false
	
	var	i = 0
	for itemLoop in itemList:
		var inventoryItem=GlobalItems.getInventoryNameById(itemLoop)
		
		print("items/"+inventoryItem)
		
		var node= get_node("items/"+inventoryItem)
		node.visible=true
		
		node.global_transform.origin=Vector3(2.5*i,1,-3)
		
		i+=1
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _physics_process(delta):
	process_input(delta)


func process_input(delta):
	
	var vector=Vector3.ZERO
	
	if Input.is_action_pressed("ui_up"):
		vector=Vector3(0,speed,0)
	if Input.is_action_pressed("ui_down"):
		vector=Vector3(0,-speed,0)
	if Input.is_action_pressed("ui_left"):
		vector=Vector3(speed,0,0)
	if Input.is_action_pressed("ui_right"):
		vector=Vector3(-speed,0,0)
	
	if Input.is_action_just_pressed("ui_accept"):
		pass
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().change_scene("res://flat.tscn")
		pass
		
	vector*=delta
	
	$items.translate(vector)
		
 
