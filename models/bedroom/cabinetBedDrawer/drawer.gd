extends MeshInstance

func open():
	global_translate(Vector3(0,0,0.4))
	
func close():
	global_translate(Vector3(0,0,-0.4))
	
