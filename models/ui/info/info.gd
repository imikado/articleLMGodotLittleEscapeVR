extends Spatial

export (float) var time=0.9

func setText(text_):
	$Viewport/Panel/Label.text=text_

func showInfo(text_):
	setText(text_)	
	$MeshInstance.visible=true
	
	$Timer.wait_time=time
	
	$Timer.start()


func hideInfo():
	$MeshInstance.visible=false



func _on_Timer_timeout():
	hideInfo()
