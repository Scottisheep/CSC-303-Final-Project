package character.collision;

import flixel.FlxObject;
import flixel.math.FlxPoint;
import haxe.Timer;
import flixel.util.FlxColor;

class Hitbox extends FlxObject
{
	private var box:Int;
	private var chr:Character;

	private var offsetFromChr:FlxPoint = new FlxPoint(0, 0);

	public var colliding:Bool;

	override public function new(character:Character, boxNumber:Int)
	{
		box = boxNumber;
		chr = character;
		colliding = false;
		super(0, 0);
		setSize(0, 0);

		#if FLX_DEBUG
		debugBoundingBoxColor = FlxColor.RED;
		#end
	}

	public function checkAction()
	{
		if (chr.actionJustStarted)
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
		}
	}

	override function update(elapsed:Float)
	{
		if (chr.player)
		{
			setPosition(chr.position.x + offsetFromChr.x, chr.position.y + offsetFromChr.y);
		}
		else
		{
			setPosition(chr.position.x - offsetFromChr.x, chr.position.y - offsetFromChr.y);
		}
		super.update(elapsed);
	}
}
