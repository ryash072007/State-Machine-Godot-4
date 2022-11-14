@tool
extends EditorPlugin

var FSM_CONTROL := load("res://addons/state_machine/Scripts/FiniteStateMachine/FSM Control.gd")
var FSM_STATE := load("res://addons/state_machine/Scripts/FiniteStateMachine/FSM State.gd")

var temp_texture := Texture2D.new()

func _enter_tree():
	add_custom_type("FSM Control", "Node", FSM_CONTROL, temp_texture)
	add_custom_type("FSM State", "Node", FSM_STATE, temp_texture)


func _exit_tree():
	remove_custom_type("FSM Control")
	remove_custom_type("FSM State")
