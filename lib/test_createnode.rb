#! /usr/bin/ruby
require "rubygems"
require "xmpp4r"
require "yaml"
require "xmpp4r/pubsub"
require "xmpp4r/pubsub/helper/servicehelper.rb"
require "xmpp4r/pubsub/helper/nodebrowser.rb"
require "xmpp4r/pubsub/helper/nodehelper.rb"

include Jabber
# read config
config = YAML::load( File.open( 'config.yml' ) )
jid = config['jid']
password = config['password']
service = config['service']
node = config['node']
Jabber::debug = config['debug']

client = Client.new(JID.new(jid))
client.connect
client.auth(password)

client.send(Jabber::Presence.new.set_type(:available))
pubsub = PubSub::ServiceHelper.new(client, service)
pubsub.create_node('testrealtime')

