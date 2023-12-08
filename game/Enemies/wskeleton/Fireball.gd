extends Area2D
@export var SPEED = 100
@export var damage = 1



func _ready():
	$Sprite2D/AnimationPlayer.play("fireball")
	
	
	
func _physics_process(delta):
	var direction = Vector2.RIGHT.rotated(rotation)
	position += SPEED * direction * delta




func destroy():
	queue_free()
	




func _on_body_entered(body: Node) -> void:
	if body.has_method("player_hit"):
		body.player_hit(damage)
		destroy()
	if body is StaticBody2D:
		destroy()




func _on_visible_on_screen_notifier_2d_screen_exited():
	destroy()
