module ProfileHelper
# Return the user's profile URL.
def profile_for(user)
profile_url(:login => user.login)
end
end
