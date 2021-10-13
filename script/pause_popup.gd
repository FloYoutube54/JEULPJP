extends Popup


func _ready():
	pass
	
func _process(delta):
	if Input.is_action_pressed("escape"):
		get_tree().paused = !get_tree().paused
		self.visible = !self.visible
		Input.set_mouse_mode(Input.MOUSE_MODE_CONFINED)


func _on_of_pause_button_up():
	get_tree().paused = false
	$pause_popup.hide()
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _on_Option_button_up():
	$pause_popup.hide()
	$option_popup.popup()

func _on_leave_button_up():
	get_tree().quit()
