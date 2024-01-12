extends Area2D
@export var damage := 1
@onready var AttackResetTimer =$AttackResetTimer
@onready var anim = get_node("WeaponAnim")
@onready var player = get_parent()
var ATK_POINTS = 3
func _ready():
	$Sprite2D.hide()

func _physics_process(_delta):
	if not anim.is_playing():
		look_at(get_global_mouse_position())
func attack1():
	AttackResetTimer.start()
	anim.play("firstSwing")
	ATK_POINTS = 2

func attack2():
	AttackResetTimer.start()
	anim.play("secondSwing")
	ATK_POINTS = 1

func attack3():
	AttackResetTimer.start()
	anim.play("poke")
	ATK_POINTS = 3
func _on_body_entered(body: Node) -> void:
	if body.has_method("get_hit"):
		body.get_hit(damage)


func _on_attack_reset_timer_timeout():
	ATK_POINTS = 3



