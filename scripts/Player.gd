extends Node2D

var player_square: RectangleShape2D
var speed: int = 200
var window_bounds: Rect2

func _ready():
    player_square = $PlayerSquare

func _process(delta):
    var direction = Vector2.ZERO
    
    if Input.is_action_pressed("ui_right"):
        direction.x += 1
    if Input.is_action_pressed("ui_left"):
        direction.x -= 1
    if Input.is_action_pressed("ui_down"):
        direction.y += 1
    if Input.is_action_pressed("ui_up"):
        direction.y -= 1

    direction = direction.normalized()
    var movement = direction * speed * delta

    var new_position = position + movement
    update_window_bounds()

    if window_bounds.has_point(new_position):
        position = new_position

func update_window_bounds():
    window_bounds = Rect2(Vector2.ZERO, get_viewport().get_size())