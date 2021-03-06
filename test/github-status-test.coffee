Helper = require('hubot-test-helper')
chai = require 'chai'

expect = chai.expect

helper = new Helper('../src/github-status.coffee')

describe 'github-status', ->
  beforeEach ->
    @room = helper.createRoom()

  afterEach ->
    @room.destroy()

  it 'responds to github status', ->
    @room.user.say('alice', '@hubot github status').then =>
      console.log(@room.messages)
      expect(@room.messages).to.eql [
        ['alice', '@hubot github status']
        ['hubot', '@alice ']
      ]

  it 'hears orly', ->
    @room.user.say('bob', 'just wanted to say orly').then =>
      expect(@room.messages).to.eql [
        ['bob', 'just wanted to say orly']
        ['hubot', 'yarly']
      ]
