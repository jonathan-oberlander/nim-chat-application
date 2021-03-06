import json

type 
  Message* = object
    username*:string
    message*: string

proc parseMessage*(data: string): Message =
  ## parses the json message
  let dataJson = parseJson(data)
  result.username = dataJson["username"].getStr()
  result.message = dataJson["message"].getStr()

##[
  creates the json message
  $ converts any type to a string value.
  % converts strings, integers, floats, and more 
    into the appropriate JsonNodes.
]##
proc createMessage*(username: string, message: string): string =
  result = $(%{
    "username": %username,
    "message": %message
  }) & "\c\l"



#[
  procedure tests
]#
when isMainModule:
  block:
    let data = """{"username":"John", "message": "Hello there !"}"""
    let parsed = parseMessage(data)
    doAssert parsed.username == "John"
    doAssert parsed.message == "Hello there !"
  block:
    let expected = """{"username":"dom","message":"hello"}""" & "\c\l"
    doAssert createMessage("dom", "hello") == expected
