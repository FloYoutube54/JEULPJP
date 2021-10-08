extends Spatial


func _process(delta):
	$FPS_COUNTER.text = str(Engine.get_frames_per_second())
	
	if Input.is_action_pressed("escape"):
		get_tree().paused = true
		$pause_popup.popup()
		
	
