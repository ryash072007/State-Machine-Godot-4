extends Node2D

var previous_position: Vector2

func _ready():
	print("----------------------------------------")
	previous_position = position

func _physics_process(_delta):
	position = get_global_mouse_position()
	
	if position != previous_position:
		$FSM_Control.activate_state("moving")
	else:
		$FSM_Control.activate_state("idle")
	
	previous_position = position


func _on_idle_state_activated():
	$color.color = Color.WHITE
	print_debug("Entering Idle State")
	print("----------------------------------------")


func _on_moving_state_activated():
	$color.color = Color.GOLD
	print_debug("Entering Moving State")
	print("----------------------------------------")


func _on_idle_state_exiting():
	print_debug("Exiting Idle State")
	print("----------------------------------------")


func _on_moving_state_exiting():
	print_debug("Exiting Moving State")
	print("----------------------------------------")
