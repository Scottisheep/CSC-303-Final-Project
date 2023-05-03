package character;

import character.collision.Hitbox;
import character.collision.Hurtbox;
import character.collision.Pushbox;
import character.sprite.Sprite;
import flixel.group.FlxGroup;
import flixel.math.FlxPoint;

class Character extends FlxGroup
{
	private static var PLAYER_1_START_X:Float = 30;
	private static var PLAYER_2_START_X:Float = 350;
	private static var PLAYER_START_Y:Float = 50;

	public var width:Int = 75;
	public var height:Int = 150;

	public var fighter:Int;
	public var player:Int;
	public var position:FlxPoint = new FlxPoint(0, 0);

	public var hurtboxes:FlxTypedGroup<Hurtbox>;
	public var hitboxes:FlxTypedGroup<Hitbox>;
	public var sprite:Sprite;
	public var pushbox:Pushbox;

	public function new(player:Bool, fighter:Int)
	{
		super();

		if (player)
		{
			position.x = PLAYER_1_START_X;
		}
		else
		{
			position.x = PLAYER_2_START_X;
		}

		position.y = PLAYER_START_Y;

		initializeAll();
		addAllToGroup();
	}

	private function initializeAll()
	{
		sprite = new Sprite(this);
		pushbox = new Pushbox(this);
		hurtboxes = new FlxTypedGroup<Hurtbox>(3);
		hitboxes = new FlxTypedGroup<Hitbox>(3);
	}

	private function addAllToGroup()
	{
		add(sprite);
		add(hurtboxes);
		add(hitboxes);
		add(pushbox);
	}

	private function updateGroup(elapsed:Float)
	{
		sprite.update(elapsed);
		hurtboxes.update(elapsed);
		hitboxes.update(elapsed);
		pushbox.update(elapsed);
	}

	override function update(elapsed:Float)
	{
		position = FlxPoint.weak(pushbox.x, pushbox.y);
		updateGroup(elapsed);
		super.update(elapsed);
	}
}
