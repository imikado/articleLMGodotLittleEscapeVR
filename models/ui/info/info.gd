extends Spatial

func setText(text_):
	$Viewport/Panel/Label.text=text_

func showInfo(text_):
	setText(text_)	
	$MeshInstance.visible=true

func hideInfo():
	$MeshInstance.visible=false
