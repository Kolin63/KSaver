@tool
extends EditorPlugin

var dock

func _enter_tree():
	# Initialization of the plugin goes here.
	add_custom_type("KSaver", "Node", preload("ksaver.gd"), preload("res://addons/ksaves/icon.png"))
	dock = preload("res://addons/ksaves/SaveVariables.tscn").instantiate()
	add_control_to_dock(EditorPlugin.DOCK_SLOT_RIGHT_UL, dock)


func _exit_tree():
	# Clean-up of the plugin goes here.
	remove_custom_type("KSaver")
	remove_control_from_docks(dock)
	dock.free()
