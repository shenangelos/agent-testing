extends Node2D

var speed = 5

func _process(delta):
    var movement = Vector2.ZERO
    
    if Input.is_action_pressed("ui_up"):
        movement.y -= speed
    if Input.is_action_pressed("ui_down"):
        movement.y += speed
    if Input.is_action_pressed("ui_left"):
        movement.x -= speed
    if Input.is_action_pressed("ui_right"):
        movement.x += speed
    
    position += movement

    # Keep the square within the game window boundaries
    position.x = clamp(position.x, 0, get_viewport().size.x)
    position.y = clamp(position.y, 0, get_viewport().size.y)