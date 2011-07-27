class User < ActiveRecord::Base
has_attached_file :photo, :styles => {:small => "70x70>", :main => "250x250>" },
                  :url =>  "/system/photos/:id/:style/:basename.:extension"
belongs_to :profile
has_many :comments, :order => 'created_at DESC'
has_many :emails
has_many :friendships
has_many :subcomments,
         :foreign_key => 'commenter'
has_many :subcomments,
         :through => :comments,
         :source => :subcomments
has_many :friends,
         :through => :friendships,
         :conditions => "status = 'accepted'",
         :order => :login
has_many :requested_friends,
         :through => :friendships,
         :source => :friend,
         :conditions => "status = 'requested'",
         :order => :'friendships.created_at'
has_many :pending_friends,
         :through => :friendships,
         :source => :friend,
         :conditions => "status = 'pending'",
         :order => :'friendships.created_at'


validates_uniqueness_of :login, :email
validates_length_of :login, :within => 4..20
validates_length_of :password, :within => 4..40
validates_length_of :email, :maximum => 50
validates_presence_of :email
validates_format_of :login,
:with => /^[A-Z0-9_]*$/i,
:message => "must contain only letters, " +
"numbers, and underscores"
validates_format_of :email,
:with => /^[A-Z0-9._%-]+@([A-Z0-9-]+\.)+[A-Z]{2,4}$/i,
:message => "must be a valid email address"

def self.search(search)
  if search
    find(:all, :conditions => ['login LIKE ?', "%#{search}%"])
  else
    find(:all)
  end
end

end
