extends HFlowContainer

@onready var player = get_parent().get_parent().get_node("CharacterBody2D")

func _process(_delta):#sets the number of hearts filled on the display by the players HP
	if player.HP <= 0:
		HT0()
		player.die()
	else:
		if player.HP <= 1:
			HT1()
		else:
			if player.HP <= 2:
				HT2()
			else:
				if player.HP <= 3:
					HT3()
				else:
					if player.HP <= 4:
						HT4()




func HT0():
	$H1.set_frame(1)
	$H2.set_frame(1)
	$H3.set_frame(1)
	$H4.set_frame(1)
func HT1():
	$H1.set_frame(0)
	$H2.set_frame(1)
	$H3.set_frame(1)
	$H4.set_frame(1)
func HT2():
	$H1.set_frame(0)
	$H2.set_frame(0)
	$H3.set_frame(1)
	$H4.set_frame(1)
func HT3():
	$H1.set_frame(0)
	$H2.set_frame(0)
	$H3.set_frame(0)
	$H4.set_frame(1)
func HT4():
	$H1.set_frame(0)
	$H2.set_frame(0)
	$H3.set_frame(0)
	$H4.set_frame(0)


