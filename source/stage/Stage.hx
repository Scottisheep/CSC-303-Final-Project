package stage;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.util.FlxColor;

class Stage extends FlxSprite
{
	private static var STAGE_HEIGHT:Int = 400;

	override public function new(StageSelector:Int)
	{
		super(0, STAGE_HEIGHT);

		switch StageSelector
		{
			case 1:
				makeGraphic(FlxG.width, FlxG.height - STAGE_HEIGHT, FlxColor.GREEN);
		}
	}
}
