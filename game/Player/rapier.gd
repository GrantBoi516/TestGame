extends Area2D
@export var damage := 1
@onready var AttackResetTimer =$AttackResetTimer
@onready var anim = get_node("WeaponAnim")
var ATK_POINTS = 3
func _ready():
	$Sprite2D.hide()

func _physics_process(_delta):
	if not anim.is_playing():
		look_at(get_global_mouse_position())
func attack():
	if Input.is_action_just_pressed("click") && ATK_POINTS ==3:
		AttackResetTimer.start()
		anim.play("firstSwing")
		ATK_POINTS = ATK_POINTS - 1
	elif Input.is_action_just_pressed("click") && ATK_POINTS == 2:
		AttackResetTimer.start()
		anim.play("secondSwing")
		ATK_POINTS = ATK_POINTS - 1
	if Input.is_action_just_pressed("click") && ATK_POINTS ==1:
		AttackResetTimer.start()
		anim.play("poke")
		ATK_POINTS = ATK_POINTS - 1
func _on_body_entered(body: Node) -> void:
	if body.has_method("get_hit"):
		body.get_hit(damage)


func _on_attack_reset_timer_timeout():
	ATK_POINTS = 3
