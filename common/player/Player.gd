extends KinematicBody

signal gotoInventory

const SPEED= 160
const ROTATE_SPEED=80
const GRAVITY=10

var vel = Vector3()

var nearObject = null

func getCameraPosition():
	return global_transform.basis

func loadCameraPosition(position_):
	global_transform.basis=position_

func _physics_process(delta):
	var dir = Vector3()
	dir.y-=GRAVITY
	
	var rotate=0
	var moving=0

	if Input.is_action_pressed("ui_up"):
		moving=1
	if Input.is_action_pressed("ui_down"):
		moving=-1
		
	if Input.is_action_pressed("ui_left"):
		rotate=1
	if Input.is_action_pressed("ui_right"):
		rotate=-1

	dir += -global_transform.basis.z * moving * SPEED * delta
	
	if rotate!=0:
		self.rotate_y( deg2rad( rotate * ROTATE_SPEED) * delta )
	
	vel = move_and_slide(dir)

	if Input.is_action_just_pressed("ui_accept"):
		if nearObject && nearObject.has_method("action"):
			if nearObject.has_method("canRetrieveItem") && nearObject.canRetrieveItem():
				var item=nearObject.getItem()
				GlobalPlayer.addItem(item)
				return

			nearObject.action()
	
	if Input.is_action_just_pressed("ui_cancel"):
		emit_signal("gotoInventory")

func _on_contact_body_entered(body):
	if body.has_method('displayInfo'):
		body.displayInfo()
		
		nearObject=body


func _on_contact_body_exited(body):
	if body.has_method('hideInfo'):
		body.hideInfo()
		
		nearObject=null
