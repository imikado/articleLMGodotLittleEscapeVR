extends Spatial

export(String) var text
export(bool) var hasBackground=false
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$MeshInstance/Viewport/Label.text=text
	
	if hasBackground:
		$background.visible=true
	pass # Replace with function body.

func init(text_):
	$MeshInstance/Viewport/Label.text=text_

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
