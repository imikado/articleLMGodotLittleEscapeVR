extends "res://common/abstracts/furniture.gd"

var minLine=1
var currentLine=1
var maxLine=4

var minNumber=0
var maxNumber=9

var codeList=[0,0,0,0]

export(Array,int) var rightCode=[0,0,0,0]

signal correctCode

signal gotoSecretBoxZoom

func disableInfo():
	$info.visible=false

func _ready():
	defaultProps={
		"state":CLOSED,
		"locked":true
	}
	
	for i in range(1,5):
		setLine(i,str(0))
		unselectLine(i)
		print(str(i))
		
	selectLine(1)
	
	#$cover.close()
		
func goDown():
	currentLine+=1
	if currentLine > maxLine:
		currentLine=minLine
	
	resetThenSelectLine(currentLine)

func goUp():
	currentLine-=1
	if currentLine < minLine:
		currentLine=maxLine
	
	resetThenSelectLine(currentLine)

func goLeft():
	var code=getCurrentCode()
	code-=1
	if code < minNumber:
		code=maxNumber
	updateCurrentCode(code)

func goRight():
	var code=getCurrentCode()
	code+=1
	if code > maxNumber:
		code=minNumber
	updateCurrentCode(code)

func getCurrentCode():
	return codeList[ (currentLine-1) ]
	
func isCodeCorrect():
	for i in range(0,4):
		if codeList[i]!=rightCode[i]:
			return false
	return true

func updateCurrentCode(code):
	codeList[ (currentLine-1) ]=code
	setLine(currentLine,str(code))
	
func resetThenSelectLine(number_):
	for i in range(1,5):
		unselectLine(i)
	selectLine(number_)

func unselectLine(number_):
	var node = get_node("cover/bloc/line"+str(number_))
	var material = node.get_surface_material(0)
	material.albedo_color = Color(1, 1,1.25)
	node.set_surface_material(0, material)

	
func selectLine(number_):
	var node = get_node("cover/bloc/line"+str(number_))
	var material = node.get_surface_material(0)
	material.albedo_color = Color(1, 0, 0,0.5)
	node.set_surface_material(0, material)

func setLine(number_,text_):
	get_node("cover/bloc/line"+str(number_)+"/Viewport/Label").text=text_
	
func refreshState():
	if props.state==OPENED:
		openCover()
		
	if !props.locked:
		for i in range(0,4):
			setLine(i+1, str(rightCode[i]) )
		
func refreshItem():
	$base/kitchen_key.visible=false
	$base/exit_key.visible=false
	
	if props.item==GlobalItems.ID.KITCHEN_KEY:
		$base/kitchen_key.visible=true
		
	if props.item==GlobalItems.ID.EXIT_KEY:
		$base/exit_key.visible=true
		
func openCover():
	$cover.open()

func closeCover():
	$cover.close()

func displayInfo():
	if props.state==CLOSED:
		showInfo("Voulez-vous l'ouvrir ?")
	else:
		if props.item==GlobalItems.ID.KITCHEN_KEY:
			showInfo("Voulez-vous prendre la clef ?")
		else:
			showInfo("Voulez-vous la fermer ?")


func action():
	if props.state==CLOSED:
		if props.locked:
			
			emit_signal("gotoSecretBoxZoom")
			
			#showInfo("Elle semble fermé")
			return
		
		openCover()
		
		props.state=OPENED
	else:
		closeCover()
		
		props.state=CLOSED
	
	saveProps()
		
	displayInfo()
	

func unlock():
	props.state=OPENED
	props.locked=false
	openCover()
	saveProps()
	
func isLocked():
	return props.locked

