extends Node

const type: String = "FSM State"

@export var default_state: bool = false

var active: bool = false

signal StateActivated
signal StateExiting
signal StateExited
signal CallEveryProcessFrame(delta: float)
signal CallEveryPhysicsProcessFrame(delta: float)


func activate():
	active = true
	StateActivated.emit()

func deactivate():
	if !active: return
	StateExiting.emit()
	active = false
	StateExited.emit()

func is_active():
	return active

func _process(delta):
	if !active: return
	CallEveryProcessFrame.emit(delta)

func _physics_process(delta):
	if !active: return
	CallEveryPhysicsProcessFrame.emit(delta)
