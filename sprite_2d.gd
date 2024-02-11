extends Sprite2D

var speed = 400
var angular_speed = PI
var auto_motion = false


func _ready():
	var timer = get_node("Timer")
	timer.timeout.connect(_on_timer_timeout)


func _process(delta):
	var direction = (
		1 if auto_motion
		else -1 if Input.is_action_pressed("ui_left")
		else 1 if Input.is_action_pressed("ui_right")
		else 0
	)

	rotation += angular_speed * direction * delta
	
	var velocity = (
		Vector2.UP.rotated(rotation) * speed if Input.is_action_pressed("ui_up") or auto_motion
		else Vector2.DOWN.rotated(rotation) * speed if Input.is_action_pressed("ui_down")
		else Vector2.ZERO
	)
	
	position += velocity * delta


func _on_button_pressed():
	auto_motion = not auto_motion


func _on_timer_timeout():
	visible = not visible
