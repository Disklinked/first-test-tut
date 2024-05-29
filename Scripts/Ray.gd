extends RayCast3D

@onready var map = get_tree().root.get_node("Map")#parent
@onready var ballScene = preload("res://Map/ball.tscn")
@onready var player = map.get_node("Player")#parent
@onready var Inv = player.get_node("Inv") #parent
@onready var mesh = player.get_node("Mesh")

signal destroy_node()

func on_ray_part(object):
	if object:
		destroy_node.emit(object)
func _ready():
	print(get_tree().current_scene)

func _physics_process(_delta):
	if self.is_colliding():
		var collider = self.get_collider()
		var par = collider.get_parent()
		if collider.is_in_group("Grabbable"):
			on_ray_part(collider)
			
			
			


func _on_destroy_node(obj):
	obj.queue_free() # Replace with function body.
