extends Spatial


func _ready():
	pass

func _process(delta):
	$FPS_COUNTER.text = str(Engine.get_frames_per_second())
	
	if Input.is_action_pressed("escape"):
		get_tree().paused = true
		$pause_popup.popup()
		Input.set_mouse_mode(Input.MOUSE_MODE_CONFINED)

func _on_leave_pressed():
	pass

func _on_Option_pressed():
	pass

func _on_of_pause_pressed():
	get_tree().paused = false
	$pause_popup.hide()
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)


func _on_leave_button_up():
	get_tree().quit()
