extends Node2D

var speed = 200

func _ready():
    pass

func _process(delta):
    var velocity = Vector2.ZERO

    if Input.is_action_pressed("ui_right"):
        velocity.x += 1
    if Input.is_action_pressed("ui_left"):
        velocity.x -= 1
    if Input.is_action_pressed("ui_down"):
        velocity.y += 1
    if Input.is_action_pressed("ui_up"):
        velocity.y -= 1

    velocity = velocity.normalized() * speed * delta

    position += velocity
    position.x = clamp(position.x, 0, get_viewport().size.x - rect_size.x)
    position.y = clamp(position.y, 0, get_viewport().size.y - rect_size.y)