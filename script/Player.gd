extends KinematicBody

var velocity = Vector3.ZERO
var speed = 10
export var walk_speed = 10
export var run_speed = 16
var gravity = 1

# rotation de la cam
onready var player_camera = $"Camera"
var spin = 0.1
export var mouse_sensitivity = 5

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _physics_process(delta):
	
	if not is_on_floor():
		velocity.y += -gravity
	movement(delta)
	velocity = move_and_slide(velocity, Vector3.ZERO)
	
func movement(_delta):
	
	var dir = Vector3.ZERO
	var vel_y = velocity.y
	
	velocity = Vector3.ZERO
	
	# tu avance ou tu recule michael
	if Input.is_action_pressed("forward"):
		dir += transform.basis.y
	elif Input.is_action_pressed("back"):
		dir -= transform.basis.y
	
	# droite ou gauche
	if Input.is_action_pressed("right"):
		dir -= transform.basis.x
	elif Input.is_action_pressed("left"):
		dir += transform.basis.x
	
	
	# cours petit
	if Input.is_action_pressed("run"):
		
		speed = run_speed
	else:
		speed = walk_speed
	
	velocity = dir.normalized() * speed
	velocity.y = vel_y


func _input(event):
	if event is InputEventMouseMotion and Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
		
		rotate_y(lerp(0, -spin, event.relative.x*(mouse_sensitivity * 0.01) ))
		player_camera.rotate_x(lerp(0,spin, event.relative.y*(mouse_sensitivity * 0.01) ))
		
		
		#la rotation verticale
		var curr_rot = player_camera.rotation_degrees
		curr_rot.x = clamp(curr_rot.x, 0, 180)
		player_camera.rotation_degrees = curr_rot
		
