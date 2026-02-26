```gdscript
extends Node2D

var speed = 200
var rect_size = Vector2(50, 50)  # Assuming square is 50x50 pixels
var default_color = Color(1, 1, 1)  # White
var alternate_color = Color(1, 0, 0)  # Red

func _ready():
    # Set the size of the Node2D (if it's a square) for boundary calculations
    self.set_size(rect_size)
    self.modulate = default_color

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

    # Update position while clamping to the viewport bounds
    position += velocity
    position.x = clamp(position.x, 0, get_viewport().size.x - rect_size.x)
    position.y = clamp(position.y, 0, get_viewport().size.y - rect_size.y)
    
    # Change color when spacebar is pressed
    if Input.is_action_just_pressed("ui_select"):  # "ui_select" is usually mapped to the spacebar
        self.modulate = alternate_color if self.modulate == default_color else default_color
```