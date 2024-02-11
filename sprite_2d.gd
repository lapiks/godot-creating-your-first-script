extends Sprite2D

var speed = 400
var angular_speed = PI


func _process(delta):
	var direction = (
		-1 if Input.is_action_pressed("ui_left")
		else 1 if Input.is_action_pressed("ui_right")
		else 0
	)

	rotation += angular_speed * direction * delta
	
	var velocity = (
		Vector2.UP.rotated(rotation) * speed if Input.is_action_pressed("ui_up")
		else Vector2.DOWN.rotated(rotation) * speed if Input.is_action_pressed("ui_down")
		else Vector2.ZERO
	)
	
	position += velocity * delta
