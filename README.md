# About:

This is just a very simple class which does scaling objects keeping their proportion.

The good stuff is that this class can scale properly your object by cropping (using the lower value) it or just fitting by the highest dimension.

The class API was designed to be ease and intuitive.

##Simple fit:##
<pre>
resize(a).toFitIn(b);
</pre>
* * *
##Crop:##

Resize by the lower dimension:

<pre>
resize(a).toFitIn(b, true);
</pre>
* * *
##Multipliers##

In case of resizing videos this [link](http://labs.influxis.com/?p=6)
has a good explanation about how important is keeping the proper dimension in videos:

<pre>
resize(a).multipleOf( 16 ).toFitIn(b);
</pre>
* * *
##Tweening##

If you are that guy who loves doing this scale using *"tween"*, I did a method for you:

<pre>
var r : Rectangle = resize(a).simulate().toFitIn(b).bounds;
Tweener.addTween( a, {width:r.width, height:r.height, time:0.5} );
</pre>