package character.collision;

import haxe.Timer;
import flixel.math.FlxPoint;
import flixel.FlxObject;
import flixel.util.FlxColor;

class Hurtbox extends FlxObject
{
	private var offsetFromChr:FlxPoint = new FlxPoint(0, 0);

	private var box:Int;
	private var chr:Character;

	override public function new(character:Character, boxNumber:Int)
	{
		box = boxNumber;
		chr = character;
		super(0, 0);
		setSize(0, 0);

		#if FLX_DEBUG
		debugBoundingBoxColor = FlxColor.GREEN;
		#end
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
			if (chr.action == DebugAttack)
			{
				var phase1Time:Int = 500;
				var phase2Time:Int = 350;
				switch box
				{
					case 1:
						offsetFromChr = FlxPoint.weak(70, 55);
						setSize(25, 25);
						Timer.delay(function phase1()
						{
							offsetFromChr = FlxPoint.weak(70, 65);
							setSize(25, 25);
							Timer.delay(function endAttack()
							{
								setSize(0, 0);
								offsetFromChr = FlxPoint.weak(0, 0);
							}, phase2Time);
						}, phase1Time);
					case 2:
						offsetFromChr = FlxPoint.weak(90, 35);
						setSize(35, 35);
						Timer.delay(function phase1()
						{
							offsetFromChr = FlxPoint.weak(85, 65);
							setSize(35, 35);
							Timer.delay(function endAttack()
							{
								setSize(0, 0);
								offsetFromChr = FlxPoint.weak(0, 0);
							}, phase2Time);
						}, phase1Time);
					case 3:
						offsetFromChr = FlxPoint.weak(105, 20);
						setSize(45, 45);
						Timer.delay(function phase1()
						{
							offsetFromChr = FlxPoint.weak(105, 75);
							setSize(55, 55);
							Timer.delay(function endAttack()
							{
								setSize(0, 0);
								offsetFromChr = FlxPoint.weak(0, 0);
							}, phase2Time);
						}, phase1Time);
				}
			}
		}
		else if (chr.action == Ready)
		{
			switch box
			{
				case 1:
					offsetFromChr = FlxPoint.weak(20, 0);
					setSize(35, 35);
				case 2:
					offsetFromChr = FlxPoint.weak(5, 35);
					setSize(65, 60,);
				case 3:
					offsetFromChr = FlxPoint.weak(10, 95);
					setSize(55, 105);
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
