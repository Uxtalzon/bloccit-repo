 class PostPolicy < ApplicationPolicy
   
   def index?
     true
   end
   
   def destroy?
     user.present? && (record.user == user || user.moderator? || user.admin?)
   end
 end