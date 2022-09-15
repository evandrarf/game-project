extends Sprite


export var speed = 200
var screen_size 
onready var nos_animation = $Control2

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
	nos_animation.hide()
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
		state = RIGHT
		nos_animation.show()
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
		state = LEFT
		nos_animation.show()
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
		state = DOWN
		nos_animation.show()
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1
		state = UP
		nos_animation.show()
		
	match state:
		UP:
			rotate(0)
			flip_v = false
			frame = 0
			nos_animation.rect_position = Vector2(-36.4, 71.172)
			nos_animation.rect_rotation = 0
		DOWN :
			rotate(0)
			flip_v = true
			frame = 0
			nos_animation.rect_position = Vector2(37, -70.019)
			nos_animation.rect_rotation = 180
		RIGHT :
			flip_v = false
			flip_h = false
			frame = 1
			nos_animation.rect_position = Vector2(-80.713, -41.356)
			nos_animation.rect_rotation = 90
		LEFT :
			flip_v = false
			frame =  1
			flip_h = true
			nos_animation.rect_position = Vector2(86.56, 25.968)
			nos_animation.rect_rotation = 270
	
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



