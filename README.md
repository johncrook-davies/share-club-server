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
### Prices are currently updated using heroku scheduler
Currently prices are updated using heroku scheduler. This is not a long term solution as a rake task must be executed each time, the scheduler is always active (which can be countered by adding a time dependancy to the rake task) and tasks can only be run every 5 minutes.

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
* The redis addon for heroku is used. Configure heroku for this with the following command and add the url to `config/cable.yml`.
```zsh
    heroku config --app warm-mesa-02274 | grep REDISTOGO_URL
```