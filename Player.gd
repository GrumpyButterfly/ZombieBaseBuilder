extends CharacterBody2D


const SPEED = 300.0
var SprintMult = 1.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var sprintBool = Input.is_physical_key_pressed(KEY_SHIFT)
	if sprintBool:
		SprintMult = 2
	else:
		SprintMult = 1
	
	var horizDirection = Input.get_axis("ui_left", "ui_right")
	if horizDirection:
		velocity.x = horizDirection * SPEED * SprintMult
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	var vertDirection = Input.get_axis("ui_up", "ui_down")
	if vertDirection:
		velocity.y = vertDirection * SPEED * SprintMult
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)
		
	move_and_slide()
