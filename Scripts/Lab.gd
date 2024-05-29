extends Label


func _process(delta):
	self.text = str(get_parent().get_parent().get_node("Player/Mesh").global_transform.origin)
