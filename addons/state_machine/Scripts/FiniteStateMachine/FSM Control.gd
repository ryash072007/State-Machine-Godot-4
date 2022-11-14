#FSM Control
extends Node

var states: Dictionary = {
#	"state_name": active or inactive (true or false)
}

func _ready():
	
	var default_already_set: bool = false
	
	for child in get_children():
		if "type" in child:
			if child.type == "FSM State":
				if !default_already_set and child.default_state == true:
					states[child.name] = true
					default_already_set = true
				else:
					states[child.name] = false
	
#	print(states)

func activate_state(state_name: String) -> int:
	
	if state_name == get_active_state(): return OK
	
	if !states.has(state_name): return FAILED
	
	var err = get_node_or_null(state_name)
	if err == null: return FAILED
	
	if !err.has_method("activate"): return FAILED
	
	
	var active_state: String = get_active_state()
	
	if active_state == "null":
		return FAILED
	
	var active_state_node: Node = get_node_or_null(active_state)
	if active_state_node == null: return FAILED
	
	if !active_state_node.has_method("deactivate"): return FAILED
	
	active_state_node.deactivate()
	err.activate()
	
	states[active_state] = false
	states[state_name] = true
	
	return OK

func get_active_state() -> String:
	for key in states.keys():
		if states[key] == true:
			return key
	
	return "null"

func get_states() -> Dictionary:
	return states
