extends Node2D

var speed = 200
var player_square

func _ready():
    player_square = $PlayerSquare

func _process(delta):
    var motion = Vector2.ZERO
    
    if Input.is_action_pressed("ui_right"):
        motion.x += 1
    if Input.is_action_pressed("ui_left"):
        motion.x -= 1
    if Input.is_action_pressed("ui_down"):
        motion.y += 1
    if Input.is_action_pressed("ui_up"):
        motion.y -= 1
    
    motion = motion.normalized() * speed * delta
    player_square.position += motion
    
    # Clamp position to window boundaries
    player_square.position.x = clamp(player_square.position.x, 0, get_viewport().size.x - player_square.rect_size.x)
    player_square.position.y = clamp(player_square.position.y, 0, get_viewport().size.y - player_square.rect_size.y)