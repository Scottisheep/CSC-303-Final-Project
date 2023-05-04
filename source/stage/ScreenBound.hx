package stage;

import flixel.FlxG;
import flixel.FlxObject;

class ScreenBound extends FlxObject
{
	private static var BOUND_THICKNESS:Float = 25;
	private static var BOUND_OFFSET:Float = 1;

	override public function new(side:Bool)
	{
		if (side)
		{
			super(BOUND_OFFSET - BOUND_THICKNESS, 0, BOUND_THICKNESS, FlxG.height);
		}
		else
		{
			super(FlxG.width - BOUND_OFFSET, 0, BOUND_THICKNESS, FlxG.height);
		}
		immovable = true;
	}
}
