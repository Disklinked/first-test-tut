extends Node3D

var ball := preload("res://Map/ball.tscn")
const limit: int = 500

var weapons = ["orange","red sword"]

var inv := {
	"weapon" : weapons,
	"food" : weapons
	
	
}


func _ready():
	print(weapons[0])
	for n in range(0,limit,1):
		var newBall = ball.instantiate()
		newBall.position = get_tree().current_scene.get_node("/root/Map/Parts/spinner/point").global_position
		add_child(newBall)
		await get_tree().create_timer(0.2).timeout
	
