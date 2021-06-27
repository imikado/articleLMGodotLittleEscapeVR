extends Spatial

signal gotoChessBoardZoom
signal gotoRemoteControlZoom

var room="livingRoom"

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	
	$tableCoffee/remoteControl.init(room,"remoteControl")
	
	$tableCoffee/chess_board.init(room,"chessBoard")
	
	$cabinetTelevision/television.init(room,"tv")
	
	$tableCloth.init(room,"secretBox")
	
	$laptop.init(room,"laptop")
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_chess_board_gotoChessBoardZoom():
	emit_signal("gotoChessBoardZoom")



func _on_remoteControl_gotoRemoteControlZoom():
	emit_signal("gotoRemoteControlZoom")

