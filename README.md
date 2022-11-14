# Node-Based State Machine - Godot 4

## Index

 1. Deterministic Finite State Machine (FSM)
 2. To be added later:
		 - Non-Deterministic State Machine

## FSM
Two new nodes has been added in the "add new child" section.
They are:

 1. FSM Control
 2. FSM State

## <u>**1. FSM Control**</u>

Necessary container/parent node of FSM State.
There are no options to be configured for this node.
The names of the states are set as the name of the FSM State node.

**Methods:**

 1. `activate_state(state_name)`:
Returns either error code `OK` or `FAILED`.
state_name is a string.
state_name must be the name of any FSM State node under this FSM Control node.

2. `get_active_state()`:
Returns the name of the current active state in this FSM Control node.

3. `get_states()`:
Return a Dictionary of all the states in this FSM Control node along with a Boolean value that shows whether a state is active or not.

**Signals:**

 1. `newStateActivated(state_name: String)`:
 This signal is emitted whenever a new state is activated and returns the new state's name.

## <u>**2. FSM State**</u>

Child node of FSM Control.
The name of this node becomes the name of a new state.

**Options:**

 1. `default_state`:
 A Boolean value that states whether this state is the default state of the FSM Control Node. If more than one `default_state` states are set then the first FSM State that is set as default will be set as default.
 
 **Signals:**
 
 1. `CallEveryPhysicsProcessFrame(delta: float)`:
 If the current state is active then this signal is emitted every physics frame and return the time difference between previous physics frame and current physics frame.
 
2. `CallEveryProcessFrame(delta: float)`:
 If the current state is active then this signal is emitted every process frame and return the time difference between previous process frame and current process frame.
 
3. `StateActivated`:
This signal is emitted when this state get activated.

4. `StateExited`:
This signal is emitted when this state get deactivated/exited.

5. `StateExiting`:
This signal is emitted when this state is about to deactivate/exit .

# Project by Ryash
