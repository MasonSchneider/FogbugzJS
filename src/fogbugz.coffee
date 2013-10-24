https = require 'https'
xml2js = require 'xml2js'
fogbugzURL = null

LogOn = (username, password, token, callback) ->
	CallApi('cmd=logon&email=' + username + '&password=' + password, null, (err, result) ->
		if err then callback(new Error('Error logging in ' + err.message)) else callback(null, result['token'][0])
	)

SetURL = (url) -> fogbugzURL = url

# Calls the Fogbugz XML Api and returns the result as JSON
# TODO: Better parsing of URL (eg use sax to parse it while it comes through)
CallApi = (commandText, token = '', callback) ->
	#if(token) token = '&token=' + token else ''
	if !fogbugzURL
		callback(new Error('You have not specified a URL to call the API with'))
		return
	xml = ''

	https.get(fogbugzURL + commandText + GetToken(token), (response) ->
		response.on('data', (chunk) ->
			xml += chunk
		)

		response.on('error', (error) ->
			callback(new Error(error.message))
		)

		response.on('end', ->
			xml2js.parseString(xml, (err, result) ->
				if result['response']['error'] 
					callback(new Error(JSON.stringify(result['response']['error'])))
				else
					callback(null, result['response'])
			)
		)
	)

	GetToken = (nullableToken) ->
		if nullableToken
			'&token= #{nullabletoken}'
		else
			''