extends Spatial

var room='kitchen'

var secretBox

func _ready():
	GlobalGame.initCamera()
		
	$secretBoxWithCode.init(room,"secretBox",GlobalItems.ID.EXIT_KEY)

	secretBox=$secretBoxWithCode
	




func _physics_process(delta):
	
	if Input.is_action_just_pressed("ui_up"):
		secretBox.goLeft()
	if Input.is_action_just_pressed("ui_down"):
		secretBox.goRight()
	if Input.is_action_just_pressed("ui_left"):
		secretBox.goUp()
	if Input.is_action_just_pressed("ui_right"):
		secretBox.goDown()
	
	if Input.is_action_just_pressed("ui_accept"):
		if !secretBox.isLocked():
			get_tree().change_scene("res://flat.tscn")
			return
		
		if secretBox.isCodeCorrect():
			showInfo("Code ok")
			secretBox.unlock()

		else:
			showInfo("Code incorrect")
		
		pass
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().change_scene("res://flat.tscn")
		
		
func showInfo(text_):
	secretBox.showInfo(text_)
