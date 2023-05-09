package character.collision;

import flixel.system.debug.FlxDebugger;
import flixel.FlxSprite;
import flixel.math.FlxPoint;
import flixel.util.FlxColor;
import haxe.Timer;

class Hitbox extends FlxSprite
{
	private var box:Int;
	private var chr:Character;
	private var spriteColor:FlxColor = 0x40FF0000;

	private var offsetFromChr:FlxPoint = new FlxPoint(0, 0);

	public var colliding:Bool;

	override public function new(character:Character, boxNumber:Int)
	{
		debugBoundingBoxColor = FlxColor.RED;
		box = boxNumber;
		chr = character;
		colliding = false;
		super(0, 0);
		makeGraphic(1, 1, spriteColor);
		visible = false;
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
			if (chr.action == DebugAttack)
			{
				visible = true;
				colliding = true;
				var phase1Time:Int = 500;
				var phase2Time:Int = 350;
				switch box
				{
					case 1:
						offsetFromChr = FlxPoint.weak(70, 55);
						makeGraphic(25, 25, spriteColor);
						updateHitbox();
						Timer.delay(function phase1()
						{
							offsetFromChr = FlxPoint.weak(70, 65);
							makeGraphic(25, 25, spriteColor);
							updateHitbox();
							Timer.delay(function endAttack()
							{
								visible = false;
								colliding = false;
							}, phase2Time);
						}, phase1Time);
					case 2:
						offsetFromChr = FlxPoint.weak(90, 35);
						makeGraphic(35, 35, spriteColor);
						updateHitbox();
						Timer.delay(function phase1()
						{
							offsetFromChr = FlxPoint.weak(85, 65);
							makeGraphic(35, 35, spriteColor);
							updateHitbox();
							Timer.delay(function endAttack()
							{
								visible = false;
								colliding = false;
							}, phase2Time);
						}, phase1Time);
					case 3:
						offsetFromChr = FlxPoint.weak(105, 20);
						makeGraphic(45, 45, spriteColor);
						updateHitbox();
						Timer.delay(function phase1()
						{
							offsetFromChr = FlxPoint.weak(105, 75);
							makeGraphic(55, 55, spriteColor);
							updateHitbox();
							Timer.delay(function endAttack()
							{
								visible = false;
								colliding = false;
							}, phase2Time);
						}, phase1Time);
				}
			}
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
