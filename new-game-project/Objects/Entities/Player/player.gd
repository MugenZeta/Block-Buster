extends CharacterBody2D

@export var MAX_SPEED = 300.0
@export var JUMP_VELOCITY = -400.0
@export var GRAVITY = get_gravity()
@export var ACCEL = 10.0
@export var DECEL = 0.75

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += GRAVITY * delta
		print(GRAVITY)

	# Handle jump.
	if Input.is_action_just_pressed("Jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("Move_Left", "Move_Right")
	
	if direction:
		velocity.x = move_toward(velocity.x, direction * MAX_SPEED, ACCEL)
	else:
		velocity.x = move_toward(velocity.x, direction * MAX_SPEED, DECEL)

	move_and_slide()
