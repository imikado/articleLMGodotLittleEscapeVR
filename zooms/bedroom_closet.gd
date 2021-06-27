extends Spatial

var room="bedroom"

func _ready():
	GlobalGame.initCamera()

	$closet.init(room,"closet",GlobalItems.ID.BEDROOM_KEY)

	$closet.zoom()
	
	$info.hideInfo()
	


func _physics_process(delta):
	
	if Input.is_action_just_pressed("ui_up"):
		$closet.goUp()
	if Input.is_action_just_pressed("ui_down"):
		$closet.goDown()
	if Input.is_action_just_pressed("ui_left"):
		$closet.goLeft()
	if Input.is_action_just_pressed("ui_right"):
		$closet.goRight()
	
	if Input.is_action_just_pressed("ui_accept"):
		if !$closet.isLocked():
			get_tree().change_scene("res://flat.tscn")
			return
		
		if $closet.isSecretCode():
			showInfo("Code ok")
			$closet.unlock()
		else:
			showInfo("Code incorrect")
		
		pass
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().change_scene("res://flat.tscn")
		
func showInfo(text_):
	$info.showInfo(text_)
	#$Timer.start()

func _on_Timer_timeout():
	$info.hideInfo()
