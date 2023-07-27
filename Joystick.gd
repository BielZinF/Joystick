extends Node2D
onready var Ball = $Ball

var touch_id = -1


func _input(event):
	
	if Input.is_action_pressed("joy"):
		if event is InputEventScreenTouch:
			if touch_id == -1:
				touch_id = event.index
		if event is InputEventScreenDrag:
			if event.index == touch_id:
				ball_moviment(event.position)
	else:
		Ball.position = Vector2()
		touch_id = -1

func ball_moviment(mouse_pos) -> void:
	
	Ball.global_position = mouse_pos
	if Ball.position.distance_to(Vector2()) >= 88:
		Ball.position = Ball.position.normalized() * 88



#Script do movimento =========================================================
onready var cam : Position3D = $"../Cam"
var speed : float = 0.0005
func moviment() -> void:
	var pos : Vector3
	pos.z += Ball.position.y * cam.global_transform.basis.z.z  * speed
	pos.x += Ball.position.y * cam.global_transform.basis.z.x  * speed
	pos.x += Ball.position.x * cam.global_transform.basis.z.z  * speed
	pos.z += -Ball.position.x * cam.global_transform.basis.z.x  * speed
	cam.global_transform.origin += (pos)

func _physics_process(delta):
	moviment()
#==============================================================================
