tool
extends EditorPlugin

## Init new button at path.
var panel = preload("res://addons/test_feature/bottom.tscn") 
var control := Control.new()

##############################################################
# Run at the first time the feature is activated
##############################################################
func _enter_tree():
	print("Feature activated")
	control = panel.instance()
	add_control_to_bottom_panel(control, "Show active plugins")
##############################################################

##############################################################
# Remove control from the panel when feature is inactive
##############################################################
func _exit_tree():
	print("Feature Inactive")
	# Remove feature button from bottom panel when the feature is inactivated 
	remove_control_from_bottom_panel(control)
##############################################################
