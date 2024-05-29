extends CharacterBody3D  

var speed : float = 5
const MaxSpeed: float = 8
const MinSpeed: float = 5
const jump_Vel : float = 5
const sens: float = 1
var mode: bool = false



var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	$Mesh.position

func _input(event):
	if event is InputEventMouseMotion and not mode:
		rotate_y(deg_to_rad(-event.relative.x * sens))
		#rotation.y = clamp(rotation.y,deg_to_rad(-45),deg_to_rad(45))
		$Pivot.rotate_x(deg_to_rad(event.relative.y * sens))
		$Pivot.rotation.x = clamp($Pivot.rotation.x,deg_to_rad(-55),deg_to_rad(55))
		
		
	if Input.is_action_just_pressed("set_mode"):
		if mode:
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
			mode = false
		else:
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
			mode = true
			
		
		
func _physics_process(delta):
	
	if mode:
		return
	
	if not is_on_floor():
		velocity.y -= gravity * delta
	
	if Input.is_action_pressed("sprint") and is_on_floor():
		speed = MaxSpeed
	else:
		speed = MinSpeed
	
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jump_Vel
		
	if Input.is_action_just_pressed("teleport") and not is_on_floor():
		var distance: float = (position - Vector3.ONE).length()
		if distance > 2:
			position = Vector3.ONE
	
	var input_dir = Input.get_vector("move_right","move_left","move_back","move_forward")
	var direction = (transform.basis * Vector3(input_dir.x,0,input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * speed
		velocity.z = direction.z * speed
	else:
		velocity.x = move_toward(velocity.x,0,speed)
		velocity.z = move_toward(velocity.z,0,speed)
		
	
	move_and_slide()



