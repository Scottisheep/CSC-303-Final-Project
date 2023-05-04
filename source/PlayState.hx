package;

import FightState;
import flixel.FlxG;
import flixel.FlxState;

class PlayState extends FlxState
{
	override public function create()
	{
		super.create();
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);

		if (FlxG.keys.justPressed.F)
		{
			FlxG.switchState(new FightState());
		}
	}
}
