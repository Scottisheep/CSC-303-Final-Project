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

	public function checkAction()
	{
		if (chr.actionJustStarted)
		{
			switch chr.action
			{
				case FrontAttack:
					Timer.delay(function waitForStartup()
					{
						switch box
						{
							case 1:
								offsetFromChr = FlxPoint.weak(45, 40);
								setSize(30, 35);
							case 2:
								offsetFromChr = FlxPoint.weak(40, 75);
								setSize(45, 55);
							case 3:
								offsetFromChr = FlxPoint.weak(10, 130);
								setSize(80, 75);
						}
						Timer.delay(function activeFrame3()
						{
							switch box
							{
								case 1:
									offsetFromChr = FlxPoint.weak(75, 45);
									setSize(30, 35);
								case 2:
									offsetFromChr = FlxPoint.weak(55, 80);
									setSize(65, 55);
								case 3:
									offsetFromChr = FlxPoint.weak(10, 135);
									setSize(100, 75);
							}

							Timer.delay(function activeFrame47()
							{
								switch box
								{
									case 1:
										offsetFromChr = FlxPoint.weak(45, 40);
										setSize(30, 35);
									case 2:
										offsetFromChr = FlxPoint.weak(40, 75);
										setSize(45, 55);
									case 3:
										offsetFromChr = FlxPoint.weak(10, 130);
										setSize(80, 80);
								}
								Timer.delay(function activeFrame8()
								{
									switch box
									{
										case 1:
											offsetFromChr = FlxPoint.weak(35, 35);
											setSize(30, 35);
										case 2:
											offsetFromChr = FlxPoint.weak(30, 70);
											setSize(50, 55);
										case 3:
											offsetFromChr = FlxPoint.weak(10, 125);
											setSize(80, 65);
									}
								}, 200);
							}, 266);
						}, 67);
					}, 133);
				case NeutralAttack:
				case BackAttack:
				case Ready:
			}
		}
		else if (chr.action == Ready)
		{
			switch box
			{
				case 1:
					offsetFromChr = FlxPoint.weak(35, 35);
					setSize(30, 35);
				case 2:
					offsetFromChr = FlxPoint.weak(30, 70);
					setSize(50, 55);
				case 3:
					offsetFromChr = FlxPoint.weak(10, 125);
					setSize(80, 65);
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
			setPosition((chr.position.x + chr.width) - (offsetFromChr.x + width), chr.position.y + offsetFromChr.y);
		}
		super.update(elapsed);
	}
}
