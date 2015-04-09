class CommentPolicy < ApplicationPolicy
  def destroy?
    user.present? && (record.user == user || user.moderator? || user.admin?)
  end
end