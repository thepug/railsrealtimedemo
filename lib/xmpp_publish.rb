#! /usr/bin/ruby
require "rubygems"
require "yaml"
require "xmpp4r"
require "xmpp4r/pubsub"
require "xmpp4r/pubsub/helper/servicehelper.rb"
require "xmpp4r/pubsub/helper/nodebrowser.rb"
require "xmpp4r/pubsub/helper/nodehelper.rb"
include Jabber

def publish(xml)
  # read config
  config = YAML::load( File.open( 'lib/config.yml' ) )
  jid = config['jid']
  password = config['password']
  service = config['service']
  node = config['node']
  Jabber::debug = config['debug']
  # connect XMPP client
  client = Client.new(JID.new(jid))
  client.connect
  client.auth(password)
  client.send(Jabber::Presence.new.set_type(:available))
  # create item
  pubsub = PubSub::ServiceHelper.new(client, service)
  item = Jabber::PubSub::Item.new
  doc = REXML::Document.new(xml)
  item.add(doc.root);
  pubsub.publish_item_to(node, item)
end

