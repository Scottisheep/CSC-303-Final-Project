package character;

import character.collision.Hitbox;
import character.collision.Hurtbox;
import character.collision.Pushbox;
import character.sprite.Sprite;
import flixel.FlxG;
import flixel.group.FlxGroup;
import flixel.math.FlxPoint;
import haxe.Timer;

enum MovementDirection
{
	Forwards;
	Backwards;
	Stationary;
}

enum Action
{
	FrontAttack;
	BackAttack;
	NeutralAttack;
	FrontSpecial;
	BackSpecial;
	NeutralSpecial;
	Ready;
	Recovery;
	DebugAttack;
}

class Character extends FlxGroup
{
	private static var OFFSET_FROM_SCREEN:Float = 65;
	private static var PLAYER_START_Y:Float = 250;

	public var front:Bool;
	public var back:Bool;
	public var attack:Bool;
	public var special:Bool;
	public var direction:MovementDirection;
	public var action:Action = Ready;
	public var actionJustStarted:Bool = true;

	public var width:Int = 75;
	public var height:Int = 150;
	public var gravMod:Float = 250;
	public var backwardsSpeedModifier:Float = 0.55;
	public var speedCap:Float = 350;
	public var moveAccel:Float = 5000;

	public var fighter:Int;
	public var player:Bool;
	public var position:FlxPoint = new FlxPoint(0, 0);

	public var hurtboxes:FlxTypedGroup<Hurtbox>;
	public var hitboxes:FlxTypedGroup<Hitbox>;
	public var sprite:Sprite;
	public var pushbox:Pushbox;

	public function new(p:Bool, f:Int)
	{
		super();
		fighter = f;
		player = p;

		if (p)
		{
			position.x = OFFSET_FROM_SCREEN;
		}
		else
		{
			position.x = FlxG.width - width - OFFSET_FROM_SCREEN;
		}

		position.y = PLAYER_START_Y;

		initializeAll();
	}

	private function initializeAll()
	{
		sprite = new Sprite(this);
		pushbox = new Pushbox(this);
		hurtboxes = new FlxTypedGroup<Hurtbox>(3);
		hitboxes = new FlxTypedGroup<Hitbox>(3);

		for (i in 1...4)
		{
			hurtboxes.add(new Hurtbox(this, i));
			hitboxes.add(new Hitbox(this, i));
		}

		add(sprite);
		add(pushbox);
		add(hurtboxes);
		add(hitboxes);
	}

	private function getInputs()
	{
		if (player)
		{
			front = FlxG.keys.pressed.D;
			back = FlxG.keys.pressed.A;

			attack = FlxG.keys.pressed.T;
			special = FlxG.keys.pressed.Y;
		}
		else
		{
			front = FlxG.keys.pressed.LEFT;
			back = FlxG.keys.pressed.RIGHT;

			attack = FlxG.keys.pressed.COMMA;
			special = FlxG.keys.pressed.PERIOD;
		}
	}

	private function getDirection()
	{
		if (front && !back)
		{
			direction = Forwards;
		}
		else if (back && !front)
		{
			direction = Backwards;
		}
		else
		{
			direction = Stationary;
		}
	}

	private function getAction()
	{
		if (action == Ready)
		{
			switch direction
			{
				case Forwards:
					if (attack)
					{
						action = FrontAttack;
						actionJustStarted = true;
					}
					else if (special)
					{
						action = FrontSpecial;
						actionJustStarted = true;
					}
				case Backwards:
					if (attack)
					{
						action = BackAttack;
						actionJustStarted = true;
					}
					else if (special)
					{
						action = BackSpecial;
						actionJustStarted = true;
					}
				case Stationary:
					if (attack)
					{
						action = NeutralAttack;
						actionJustStarted = true;
					}
					else if (special)
					{
						action = NeutralSpecial;
						actionJustStarted = true;
					}
			}

			if (FlxG.keys.justPressed.SPACE)
			{
				action = DebugAttack;
				actionJustStarted = true;
			}
		}
	}

	private function testAttack()
	{
		trace("attack start");
		for (box in hitboxes)
		{
			box.checkAction();
		}
		Timer.delay(function onAttackEnd()
		{
			trace("attack end");
			action = Recovery;
			trace("recovery start");
			Timer.delay(function onRecoveryEnd()
			{
				trace("recovery end");
				action = Ready;
			}, 300);
		}, 850);
	}

	private function execAction()
	{
		if (actionJustStarted)
		{
			// switch action
			// {
			// 	case FrontAttack:
			// 	case NeutralAttack:
			// 	case BackAttack:
			// 	case FrontSpecial:
			// 	case NeutralSpecial:
			// 	case BackSpecial:
			// }
			if (action == DebugAttack)
			{
				testAttack();
			} else {action = Ready;}
			actionJustStarted = false;
		}
	}

	override function update(elapsed:Float)
	{
		position = FlxPoint.weak(pushbox.x, pushbox.y);
		getInputs();
		getDirection();
		getAction();
		execAction();
		super.update(elapsed);
	}
}
