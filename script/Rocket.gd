extends Sprite


export var speed = 200
var screen_size 

enum {
	UP
	DOWN
	LEFT
	RIGHT
}

var state = UP

func _ready():
	screen_size = get_viewport_rect().size

func _process(delta):
	var velocity = Vector2.ZERO # The player's movement vector.
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
		state = RIGHT
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
		state = LEFT
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
		state = DOWN
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1
		state = UP
		
	match state:
		UP:
			rotate(0)
			flip_v = false
			frame = 0
		DOWN :
			rotate(0)
			flip_v = true
			frame = 0
		RIGHT :
			flip_v = false
			flip_h = false
			frame = 1
		LEFT :
			flip_v = false
			frame =  1
			flip_h = true
	
	if(frame == 0):
		$Control.rect_rotation = 0
		$Control.rect_position = Vector2(0,0)
		
	else :
		$Control.rect_rotation = 90
		$Control.rect_position = Vector2(0,0)

	if velocity.length() > 0:
		velocity = velocity.normalized() * speed

	position += velocity * delta
	position.x = clamp(position.x, 0, screen_size.x)
	position.y = clamp(position.y, 0, screen_size.y)




