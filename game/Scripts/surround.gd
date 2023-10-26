extends CharacterBody2D
func _ready():
	$Sprite2D.hide()
func _physics_process(delta):
	look_at(get_global_mouse_position())
	if Input.is_action_just_pressed("q"):
		$Sprite2D.show()
		$AnimationPlayer.play("swing")
		await get_tree().create_timer(.3).timeout
		$Sprite2D.hide()

