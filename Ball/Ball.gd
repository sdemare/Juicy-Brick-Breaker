extends RigidBody2D

#var min_speed = 100.0
#var max_speed = 600.0
#var speed_multiplier = 1.0
#var accelerate = false
var decay = 0.02
var target = Vector2.ZERO
var width = 0
@export var speed = 10.0

#var released = true

#var initial_velocity = Vector2.ZERO

func _ready():
	width = $CollisionShape2D.get_shape().size.x
	target = Vector2(Global.VP.x / 2, Global.VP.y - width)
#	contact_monitor = true
#	max_contacts_reported = 8
#	if Global.level < 0 or Global.level >= len(Levels.levels):
#		Global.end_game(true)
#	else:
#		var level = Levels.levels[Global.level]
#		min_speed *= level["multiplier"]
#		max_speed *= level["multiplier"]
	

#func _on_Ball_body_entered(body):
#	if body.has_method("hit"):
#		body.hit(self)
#		accelerate = true	
#		$Highlight.modulate.a = 1.0

func _physics_process(_delta):
	target.x = clamp(target.x, 0, Global.VP.x - 2*width)
	position = target
	if $Highlight.modulate.a > 0:
		$Highlight.modulate.a -= decay

func _input(event):
	if event is InputEventMouseMotion:
		target.x += event.relative.x
#	if not released and event.is_action_pressed("release"):
#		apply_central_impulse(initial_velocity)
#		released = true

#func _integrate_forces(state):
#	if not released:
#		var paddle = get_node_or_null("/root/Game/Paddle_Container/Paddle")
#		if paddle != null:
#			state.transform.origin = Vector2(paddle.position.x, paddle.position.y - 30)	

#	if position.y > Global.VP.y + 100:
#		die()
#	if accelerate:
#		state.linear_velocity = state.linear_velocity * 1.1
#		accelerate = false
#	if abs(state.linear_velocity.x) < min_speed * speed_multiplier:
#		state.linear_velocity.x = sign(state.linear_velocity.x) * min_speed * speed_multiplier
#	if abs(state.linear_velocity.y) < min_speed * speed_multiplier:
#		state.linear_velocity.y = sign(state.linear_velocity.y) * min_speed * speed_multiplier
#	if state.linear_velocity.length() > max_speed * speed_multiplier:
#		state.linear_velocity = state.linear_velocity.normalized() * max_speed * speed_multiplier

#func change_size(s):
#	$CollisionShape2D.scale = s

#func change_speed(s):
#	speed_multiplier = s

#func die():
#	queue_free()

func hit():
	$Highlight.modulate.a = 1.0
