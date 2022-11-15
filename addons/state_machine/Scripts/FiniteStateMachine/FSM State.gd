extends Node

const type: String = "FSM State"

@export var default_state: bool = false

var _active: bool = false

signal StateActivated
signal StateExiting
signal StateExited
signal CallEveryProcessFrame(delta: float)
signal CallEveryPhysicsProcessFrame(delta: float)


func activate():
	_active = true
	StateActivated.emit()

func deactivate():
	if !_active: return
	StateExiting.emit()
	_active = false
	StateExited.emit()

func is_active() -> bool:
	return _active

func _process(delta):
	if !_active: return
	CallEveryProcessFrame.emit(delta)

func _physics_process(delta):
	if !_active: return
	CallEveryPhysicsProcessFrame.emit(delta)
