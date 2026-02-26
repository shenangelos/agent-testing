extends Node2D

var speed = 200

func _process(delta):
    var motion = Vector2.ZERO

    if Input.is_action_pressed("ui_up"):
        motion.y -= 1
    if Input.is_action_pressed("ui_down"):
        motion.y += 1
    if Input.is_action_pressed("ui_left"):
        motion.x -= 1
    if Input.is_action_pressed("ui_right"):
        motion.x += 1

    motion = motion.normalized() * speed * delta
    position += motion

    # Ensure the player square remains within the defined window boundaries
    position.x = clamp(position.x, 0, get_viewport().size.x - self.scale.x * self.texture.get_size().x)
    position.y = clamp(position.y, 0, get_viewport().size.y - self.scale.y * self.texture.get_size().y)