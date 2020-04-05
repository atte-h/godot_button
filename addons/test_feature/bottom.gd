tool
extends Node

##############################################################
# Function for reading active plugins
# Output: Contents of the file
##############################################################
func find_active_plugins():
	var path = "res://project.godot"
	var file = File.new()
	file.open(path, File.READ)
	
	var n = 0
	var text = ""
	while n < 10000: 
		var line = file.get_line()
		
		# find the start tag 
		if line.find('enabled=PoolStringArray(') != -1:
			var start_number = line.find('"')
			var stop_number = line.find_last('"')
			
			text ='Active plugins: '
			var i = start_number
			while i <= stop_number:
				text += line[i]
				i += 1 

			n = 100000
		elif line.find('[input]') != -1: 
			# This is a standard section, there won't be information about plugins after this
			n = 100000
			text = "No Active plugins"
		else: 
			text = "No Active plugins"
		n += 1 
	file.close()
	print(text)  
	return text
##############################################################

##############################################################
#Function for changeing text on label when mouse enters it 
##############################################################
func _on_Control_mouse_entered():
	var text = find_active_plugins()
	var label = get_node("Label")
	label.set_text(text)
##############################################################

##############################################################
# Function for changeing text on the label when it is drawn
##############################################################
func _on_Label_draw():
	var label = get_node("Label")
	var text = find_active_plugins()
	label.set_text(text)
##############################################################
