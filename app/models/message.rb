class Message < ActiveRecord::Base
attr_accessor :subject, :body
validates_presence_of :subject, :body
validates_length_of :subject, :maximum => 20
validates_length_of :body, :maximum => 400
def initialize(params)
@subject = params[:subject]
@body = params[:body]
end
end
