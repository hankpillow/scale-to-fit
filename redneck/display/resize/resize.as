package redneck.display.resize
{
	import redneck.display.resize.ScaleToFit;
	public function resize(value:Object,bounds:Object = null):ScaleToFit
	{
		return new ScaleToFit( value, bounds );
	}
}

