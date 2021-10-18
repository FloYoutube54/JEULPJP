extends Popup


func _ready():
	pass
	
func _process(_delta):
	
	if Input.is_action_just_pressed("escape"):
		get_tree().paused = !get_tree().paused
		self.visible = !self.visible
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

func _on_of_pause_button_up():
	get_tree().paused = !get_tree().paused
	self.visible = !self.visible
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

func _on_Option_button_up():
	self.visible = !self.visible
	$option_popup.popup()

func _on_leave_button_up():
	get_tree().quit()
