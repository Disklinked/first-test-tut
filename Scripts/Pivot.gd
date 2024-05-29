extends Node3D





func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	
func _input(event):
	if event is InputEventMouseMotion:
		
		rotation_degrees.x += event.relative.y * .1
		rotation_degrees.y -= event.relative.x * .1
		

