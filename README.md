# Share Club Server
## Notes
* This application is based on a rails project running in api mode
* Kill crashed server by first finding the PID with:
```zsh
    lsof -wni tcp:3000
```
and then killing the process with:
```zsh
    kill -9 <PID>
```
### Real time streaming with websockets
* Redis needs to be installed on the host
* The redis gem has been added to the gemfile
* Mount the Action Cable server on a sub-URI of our main application by adding this to `routes.rb`. This tells Action Cable to listen for WebSocket requests on `ws://localhost:3000/cable`.
```ruby
    mount ActionCable.server => '/cable'
```
* Define a special Messages Channel to instruct the appropriate parts of our application to broadcast to and stream from this channel.

```ruby
# app/channels/messages_channel.rb
class MessagesChannel < ApplicationCable::Channel  
    def subscribed
        stream_from 'messages'
    end
end 
```
* Stream data to the channel using.
```ruby
ActionCable.server.broadcast 'messages',
    message: 'stuff'
head :ok
```
* The channel can then be subscribed to by:
```js
    var exampleSocket = new WebSocket("ws://localhost:3000/cable");
    exampleSocket.onmessage = function (event) {
        console.log(event.data);
    }
    exampleSocket.send(JSON.stringify({
        command: "subscribe",
        identifier: JSON.stringify({channel:"<ChanelNameChanel>"})
    }))
```