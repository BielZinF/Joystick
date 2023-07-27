extends Position3D

var touch_id = -1


func _input(event):
	
	if Input.is_action_pressed("cam"):
		if event is InputEventScreenTouch:
			if touch_id == -1:
				touch_id = event.index
		if event is InputEventScreenDrag and event.index == touch_id:
			cam_rotation(event.relative)
	else:
		touch_id = -1

func cam_rotation(mouse_moviment) -> void:
	rotation.y += -deg2rad(mouse_moviment.x * 0.1)
	rotation.x += -deg2rad(mouse_moviment.y * 0.1)
	rotation_degrees.x = clamp(rotation_degrees.x,-90,90)
