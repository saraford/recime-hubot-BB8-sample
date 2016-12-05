module.exports = (robot) ->
  robot.respond /recime/i, (msg) ->
    data = JSON.stringify({
       command: 'color'
    })
    robot.http("https://recime.ai/bot/TOKEN")
      .headers('Content-Type': 'application/json', 'Accept': 'application/json')
      .post(data) (err, res, body) ->
        if res.statusCode isnt 200
          msg.send "Request didn't come back HTTP 200 :("
        else
          obj = JSON.parse(body)
          bb8color = obj.color
          #msg.send "got the #{obj.action}"
          bb8data = JSON.stringify({
             mode: 'sphero',
             command: 'color',
             value: bb8color
          })
          robot.http("http://localhost:4000")
            .header('Content-Type', 'application/json')
            .post(bb8data) (err, res, body) ->
              if res.statusCode isnt 200
                msg.send "Request didn't come back HTTP 200. it came back #{res.statusCode} :("
              else
               msg.send "bb-8 says he'll turn #{bb8color} for you!"
