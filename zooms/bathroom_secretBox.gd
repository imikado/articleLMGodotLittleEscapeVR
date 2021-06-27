extends Spatial


var room='bathroom'


func _ready():
	GlobalGame.initCamera()
	
	$toilet/secretBoxWithCode.init(room,"secretBoxWithCode",GlobalItems.ID.KITCHEN_KEY)
	#$toilet/secretBoxWithCode.disableInfo()
	
	#$toilet/secretBoxWithCode.openCover()


func _physics_process(delta):
	
	if Input.is_action_just_pressed("ui_up"):
		$toilet/secretBoxWithCode.goLeft()
	if Input.is_action_just_pressed("ui_down"):
		$toilet/secretBoxWithCode.goRight()
	if Input.is_action_just_pressed("ui_left"):
		$toilet/secretBoxWithCode.goUp()
	if Input.is_action_just_pressed("ui_right"):
		$toilet/secretBoxWithCode.goDown()
	
	if Input.is_action_just_pressed("ui_accept"):
		if !$toilet/secretBoxWithCode.isLocked():
			get_tree().change_scene("res://flat.tscn")
			return
		
		if $toilet/secretBoxWithCode.isCodeCorrect():
			showInfo("Code ok")
			$toilet/secretBoxWithCode.unlock()

		else:
			showInfo("Code incorrect")
		
		pass
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().change_scene("res://flat.tscn")
		
		
func showInfo(text_):
	$toilet/secretBoxWithCode.showInfo(text_)
