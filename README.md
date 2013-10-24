FogbugzJS
=========

A Javascript wrapper for Fogbugz's XML API


This is a npm package for nodejs written in coffeescript that calls the [FogBugz Api](http://help.fogcreek.com/8202/xml-api)
and returns results in JSON.

###Testing
If you want to test any of the written functions, edit `lib/test/settings.js` with the provided credentials to a Fogbugz site, 
edit `test.coffee` with the whatever functions you want to edit, 
compile it using `coffee --compile --output lib/test test/`, run `npm install` on the directory (if you haven't already) 
and then run `node lib/test/test.js`.

I will be adding a Jasmine/Mocha test suite in the future.

###How to Use
See `test/test.coffee` for an example of how to point the module to a Fogbugz site and to call functions
