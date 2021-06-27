extends Spatial

var room="livingRoom"

var selectedX=0
var selectedY=0

var screen=""

var numberList=[
	[1,2,3],
	[4,5,6],
	[7,8,9],
	["E",0,"A"]
]

#Tour bleu   2
#Roi rouge    1
#Fou Bleu    5
#Tour rouge  3

func _ready():
	GlobalGame.initCamera()

func _physics_process(delta):
	var dir = Vector3()
	
	var movingCase=2.3
	
	var movingX=0
	var movingY=0
	
	if Input.is_action_just_pressed("ui_up"):
		movingY=-1		
	if Input.is_action_just_pressed("ui_down"):
		movingY=1
	if Input.is_action_just_pressed("ui_left"):
		movingX=-1
	if Input.is_action_just_pressed("ui_right"):
		movingX=1
	
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().change_scene("res://flat.tscn")
	
	if Input.is_action_just_pressed("ui_accept"):
		
		var touchPressed = str(numberList[selectedY][selectedX])
		if touchPressed=="E":
			screen=screen.substr(0, screen.length()-1  )	
		elif touchPressed=="A":
			GlobalRoom.saveStateForObject(room,"tv",{"channel":screen})
			get_tree().change_scene("res://flat.tscn")
			return
		else:
			screen+=""+ touchPressed
		
		$Viewport/Label.text=screen

	if 2 < selectedX+movingX or selectedX+movingX < 0:
		return
		
	if 3 < selectedY+movingY or selectedY+movingY < 0:
		return
	
	if movingX!=0:
		selectedX+=movingX
		
	if movingY!=0:
		selectedY+=movingY
	
	if movingX!=0 or movingY!=0:
		$selected.translate(   Vector3(movingX*movingCase, 0 ,movingY*movingCase ))
