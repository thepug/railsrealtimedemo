require 'xmpp_publish'
class Post < ActiveRecord::Base
  after_save { 
    begin
      publish(self.to_xml) 
    rescue Exception=> e
      logger.info(e)
    end
  }
end
