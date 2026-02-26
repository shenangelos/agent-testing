extends Node2D

var speed = 200
var window_bounds = Rect2(Vector2.ZERO, Vector2(800, 600))

func _process(delta):
    var input_vector = Vector2.ZERO
    
    if Input.is_action_pressed("ui_right"):
        input_vector.x += 1
    if Input.is_action_pressed("ui_left"):
        input_vector.x -= 1
    if Input.is_action_pressed("ui_down"):
        input_vector.y += 1
    if Input.is_action_pressed("ui_up"):
        input_vector.y -= 1
    
    input_vector = input_vector.normalized()
    position += input_vector * speed * delta
    
    position.x = clamp(position.x, window_bounds.position.x, window_bounds.position.x + window_bounds.size.x)
    position.y = clamp(position.y, window_bounds.position.y, window_bounds.position.y + window_bounds.size.y)