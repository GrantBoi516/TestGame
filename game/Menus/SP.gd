extends HFlowContainer
@onready var anim = $SPanim
var frame = 0
func _ready():
	anim.set_frame(frame)

func plus_SP():
	frame += 1
	anim.set_frame(frame)
