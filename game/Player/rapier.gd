extends Area2D
@onready var anim = $WeaponAnim
@export var damage := 1

func _ready():
	$Sprite2D.hide()

func _physics_process(_delta):
	look_at(get_global_mouse_position())


func rapier_attack():
	anim.play("firstSwing")
	
func attack():
		rapier_attack()



func _on_body_entered(body: Node) -> void:
	if body.has_method("get_hit"):
		body.get_hit(damage)
