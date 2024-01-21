@tool
extends Control

var itemlistrows

func _ready():
	itemlistrows = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if $VariableName.text != "":
		$AddButton.visible = true
	else:
		$AddButton.visible = false
		
	if $VariableName.get_line_count() > 1:
		_on_add_button_pressed()


func _on_add_button_pressed():
	itemlistrows += 1
	var variablename = $VariableName.get_line(0)
	var spaceLocation = variablename.find(" ")
	variablename = variablename.insert(spaceLocation, " :")
	variablename = variablename.insert(0, "\"")
	variablename = variablename.insert(spaceLocation + 1, "\"")
	variablename += ","
	
	
	if spaceLocation == -1:
		variablename = $VariableName.get_line(0)
		variablename = "\"" + variablename + "\"" + " : " + variablename + ", "
		
	$ItemList.add_item(variablename, null, true)
	
	$VariableName.clear()
	_on_export_button_pressed()
	print(itemlistrows)


func _on_export_button_pressed():
	$Export.text = ""
	
	# Mandatory Stuff
	line("func ksave():")
	tab()
	line("var ksave_dict = {")
	tab(2)
	line("\"filename\" : get_scene_file_path(),")
	tab(2)
	line("\"parent\" : get_parent().get_path(),")
	tab(2)
	line("\"pos_x\" : position.x,")
	tab(2)
	line("\"pos_y\" : position.y,")
	
	# Your own variables
	for i in itemlistrows:
		tab(2)
		line($ItemList.get_item_text(i))
	
	# Closing
	tab()
	line("}")
	tab()
	line("return ksave_dict")
	

func line(line : String):
	$Export.text += line + "\n"

func tab(int = 1):
	for i in int:
		$Export.text += "	"


func _on_clear_button_pressed():
	$ItemList.clear()
	$Export.text = ""
	itemlistrows = 0


func _on_copy_button_pressed():
	$Export.select_all()
	$Export.copy()
