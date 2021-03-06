import strutils, os, threadpool

echo("\n***\nChat Application Started\n***\n")

# check the number of parameter passed to the cli
if paramCount() == 0:
  quit("Please specify the server address, e.g. ./client localhost")

let serAddr = paramStr(1)
echo("Connecting to: ", serAddr)

# spawn a thread to hold the readline procedure
# you need to import threadpool and use --threads:on
# ^ operator to retreive the value from FlowVar[T] object
# ^ operator will block current thread until a value is stored
# try the isReady procedure
while true:
  let message = spawn stdin.readLine()
  echo("Sending \"", ^message, "\"")
  if isReady(message): echo indent("...readline thread is ready", 16)
