<cfoutput>
<h1>JUnify v#JUnifyVersion()#</h1>
<h3>Make the CFWheels test framework return jUnit XML</h3>

<p>JUnify will run your CFWheels unit tests, then return the results in jUnit formatted XML.</p>

<h2>Possible Uses</h2>
<ul>
	<li>Automate your testing with your Continuous Integration server</li>
	<li>Reading XML for relaxation purposes</li>
	<li>Impressing your friends</li>
</ul>

<h2>Following the road to jUnit Glory</h2>
<ul>
	<li>Install the JUnify plugin</li>
	<li>Create a <code>JUnifyController.cfc</code> controller that calls the <code>JUnify()</code> function*. (See example below)</li>
	<li>Write some unit tests for your <a href="http://code.google.com/p/cfwheels/wiki/TestingFramework" target="_blank">app</a> or <a href="http://chapmandu.com/2012/04/03/cfwheels-plugins-and-my-unit-testing-adventures/" target="_blank">plugin</a></li>
	<li>Make a call to your JUnify url</li>
</ul>

* Controller filename and action names are unimportant

<h3>JUnifyController.cfc</h3>
<pre>
&lt;cfcomponent extends="Controller">
	
	&lt;cffunction name="index">
		&lt;cfset JUnify(params)>
	&lt;/cffunction>
		
&lt;/cfcomponent>
</pre>

<h3>Your JUnify URL</h3>
<pre>
	http://yourserver/index.cfm?controller=junifycontroller&action=index&type=app
</pre>
<p>
	Pay particular attention to the <code>type</code> parameter.
	<ul>
		<li><code>type=app</code> will run tests for your application</li>
		<li><code>type=myplugin</code> will run tests for your plugin</li>
		<li><code>type=core</code> will run tests for the CFWheels framework itself</li>
	</ul>
</p>

<h2>Credits</h2>
<p><a href="http://rocketboot.com.au" target="_blank">Rocketboots</a> for their RocketUnit test framework</p>

<h2>Disclaimer</h2>
<p>Use this plugin at your own risk. All care taken, but no responsibility.<br /> This plugin may:
	<ul>
		<li>Not work as described</li>
		<li>Make you less attractive</li>
		<li>Self-destruct after sixty seconds</li>
	</ul>
</p>

</cfoutput>