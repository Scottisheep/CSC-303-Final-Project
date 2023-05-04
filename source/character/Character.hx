package character;

import character.collision.Hitbox;
import character.collision.Hurtbox;
import character.collision.Pushbox;
import character.sprite.Sprite;
import flixel.FlxG;
import flixel.group.FlxGroup;
import flixel.math.FlxPoint;

class Character extends FlxGroup
{
	private static var PLAYER_1_START_X:Float = 30;
	private static var PLAYER_2_START_X:Float = 350;
	private static var PLAYER_START_Y:Float = 50;

	public var up:Bool;
	public var down:Bool;
	public var left:Bool;
	public var right:Bool;
	public var attack:Bool;
	public var special:Bool;

	public var width:Int = 75;
	public var height:Int = 150;
	public var gravMod:Float = 250;

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
			position.x = PLAYER_1_START_X;
		}
		else
		{
			position.x = PLAYER_2_START_X;
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

		add(sprite);
		add(hurtboxes);
		add(hitboxes);
		add(pushbox);
	}

	private function getInputs()
	{
		if (player)
		{
			left = FlxG.keys.justPressed.A;
			right = FlxG.keys.justPressed.D;

			attack = FlxG.keys.justPressed.T;
			special = FlxG.keys.justPressed.Y;
		}
		else
		{
			left = FlxG.keys.justPressed.LEFT;
			right = FlxG.keys.justPressed.RIGHT;

			attack = FlxG.keys.justPressed.COMMA;
			special = FlxG.keys.justPressed.PERIOD;
		}
	}

	override function update(elapsed:Float)
	{
		position = FlxPoint.weak(pushbox.x, pushbox.y);
		getInputs();
		super.update(elapsed);
	}
}
