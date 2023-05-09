package character.collision;

import flixel.FlxSprite;
import flixel.util.FlxColor;
import haxe.Timer;

class Hurtbox extends FlxSprite
{
	private var box:Int;
	private var chr:Character;

	public var colliding:Bool;

	override public function new(character:Character, boxNumber:Int)
	{
		box = boxNumber;
		chr = character;
		colliding = false;
		super(0, 0);
		makeGraphic(1, 1, FlxColor.GREEN);
	}

	private function checkAction()
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
			if (chr.action == DebugAttack) {}
		}
		else if (chr.action == Ready) {}
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}
