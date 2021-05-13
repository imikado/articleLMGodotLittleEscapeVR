extends ARVROrigin


func _ready():
	var vr_interface=ARVRServer.find_interface("Native mobile")
	if vr_interface and vr_interface.initialize():
			get_viewport().arvr=true
			get_viewport().hdr=false

