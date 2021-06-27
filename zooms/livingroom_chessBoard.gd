extends Spatial

var vel = Vector3()
const SPEED= 160
const ROTATE_SPEED=80


func _ready():
	GlobalGame.initCamera()
		
	$chess_board.disableInfo()



func _physics_process(delta):
	var dir = Vector3()
	
	var rotate=0
	var moving=0

	if Input.is_action_pressed("ui_up"):
		#moving=1
		pass
	if Input.is_action_pressed("ui_down"):
		#moving=-1
		pass
		
	if Input.is_action_pressed("ui_left"):
		rotate=1
	if Input.is_action_pressed("ui_right"):
		rotate=-1

	dir += -global_transform.basis.z * moving * SPEED * delta
	
	if rotate!=0:
		$chess_board.rotate_y( deg2rad( rotate * ROTATE_SPEED) * delta )
	
	if moving!=0:
		$chess_board.translate(   Vector3(0,  (moving * ROTATE_SPEED) * delta ,0 ))
		
	
	
	#vel = move_and_slide(dir)
	
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().change_scene("res://flat.tscn")
