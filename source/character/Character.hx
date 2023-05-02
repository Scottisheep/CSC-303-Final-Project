package character;

import character.collision.Pushbox;
import character.collision.Hitbox;
import character.collision.Hurtbox;
import flixel.group.FlxGroup;
import flixel.math.FlxPoint;
import character.sprite.Sprite;

class Character extends FlxGroup
{
	private static var PLAYER_1_START_X:Float = 30;
	private static var PLAYER_2_START_X:Float = 350;
	private static var PLAYER_START_Y:Float = 280;

	public var width:Int = 100;
	public var height:Int = 250;

	public var fighter:Int;
	public var player:Int;
	public var position:FlxPoint;

	var hurtboxes:FlxTypedGroup<Hurtbox> = new FlxTypedGroup<Hurtbox>(3);
	var hitboxes:FlxTypedGroup<Hitbox> = new FlxTypedGroup<Hitbox>(3);
	var sprite:Sprite;
	var pushbox:Pushbox;

	public function new(player:Int, fighter:Int)
	{
		super();
		position.y = PLAYER_START_Y;
		switch player
		{
			case 1:
				position.x = PLAYER_1_START_X;

			case 2:
				position.y = PLAYER_2_START_X;
		}
		
		sprite = new Sprite(this);

		addAllToGroup();
	}

	private function addAllToGroup() {
		add(sprite);
		add(hurtboxes);
		add(hitboxes);
		add(pushbox);
	}
}
