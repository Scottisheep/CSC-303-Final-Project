package character.collision;

import haxe.Timer;
import flixel.math.FlxPoint;
import flixel.FlxSprite;
import flixel.util.FlxColor;

class Hurtbox extends FlxSprite
{
	private var offsetFromChr:FlxPoint = new FlxPoint(0, 0);

	private var box:Int;
	private var chr:Character;
	private var spriteColor:FlxColor = 0x4000FF00;

	override public function new(character:Character, boxNumber:Int)
	{
		box = boxNumber;
		chr = character;
		super(0, 0);
		makeGraphic(1, 1, spriteColor);
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
			if (chr.action == DebugAttack){
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
				}}
		}
		else if (chr.action == Ready) {
			switch box
				{
					case 1:
						offsetFromChr = FlxPoint.weak(20, 0);
						makeGraphic(35, 35, spriteColor);
						updateHitbox();
					case 2:
						offsetFromChr = FlxPoint.weak(5, 35);
						makeGraphic(65, 60, spriteColor);
						updateHitbox();
					case 3:
						offsetFromChr = FlxPoint.weak(10, 95);
						makeGraphic(55, 105, spriteColor);
						updateHitbox();
				}
			}
		}

	override function update(elapsed:Float)
	{
		checkAction();
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
