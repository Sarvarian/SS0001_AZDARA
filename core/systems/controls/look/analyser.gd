extends Analyser


class_name LookCtlAnalyser

const ID : int = System.MoveState.INDEPENDENT
const LD : int = System.MoveState.LOOK_DEPENDENT

const F : int = System.LookState.FORWARD
const D : int = System.LookState.DIRECTION
const M : int = System.LookState.MOUSE
const T : int = System.LookState.TARGET

static func rotang(character : Character) -> float:
	var cr : bool = character.camera.rotating
	var ms : int = character.move_state
	var ls : int = character.look_state
	
	
	match cr:
		false: match ms:
			ID: match ls:
				F: return IDF(character)
				D: return IDD(character)
				M: return IDM(character)
				T: return IDT(character)
			
			LD: match ls:
				F: return LDF(character)
				D: return LDD(character)
				M: return LDM(character)
				T: return LDT(character)
		
		true: match ms:
			ID: match ls:
				F: return CRIDF(character)
				D: return CRIDD(character)
				M: return CRIDM(character)
				T: return CRIDT(character)
			
			LD: match ls:
				F: return CRLDF(character)
				D: return CRLDD(character)
				M: return CRLDM(character)
				T: return CRLDT(character)
	
	return .0


static func IDF(c : Character) -> float:
	return c.get_angle_to(c.global_position + move_dir(c))


static func IDD(c : Character) -> float:
	if look_dir(c) != Vector2.ZERO: return .0
	return c.get_angle_to(c.position + look_dir(c))


static func IDM(c : Character) -> float:
	if look_dir(c) != Vector2.ZERO:
		c.look_state = System.LookState.DIRECTION
	return c.get_local_mouse_position().angle()


static func IDT(c : Character) -> float:
	if not c.look_target:
		c.look_state = System.LookState.DIRECTION
		return .0
	return c.get_angle_to(c.look_target.global_position)


# TODO Test, Analyze and Fix the Potential BUGs
static func LDF(c : Character) -> float:
	var strength : float = clamp((c.move_dir.x + c.look_dir.x), -1, 1)
	var rot : float = deg2rad(c.rotate_weight * 200 * strength)
	if c.look_dir.y > .5: rot *= 3
	c.look_dir = Vector2.RIGHT.rotated(c.rotation + rot)
	c.look_persist_dir = Vector2.ZERO
	return IDD(c)


static func LDD(character : Character) -> float:
	return IDD(character)

static func LDM(character : Character) -> float:
	return IDM(character)

static func LDT(character : Character) -> float:
	return IDT(character)

static func CRIDF(character : Character) -> float:
	return CRLDF(character)

static func CRIDD(character : Character) -> float:
	return CRLDD(character)

static func CRIDM(character : Character) -> float:
	return CRLDM(character)

static func CRIDT(character : Character) -> float:
	return CRLDT(character)

static func CRLDF(character : Character) -> float:
	return LDF(character)

static func CRLDD(c : Character) -> float:
	# TODO This!!! Design This!!!
	return IDD(c)

static func CRLDM(character : Character) -> float:
	return IDM(character)

static func CRLDT(character : Character) -> float:
	return IDT(character)


















