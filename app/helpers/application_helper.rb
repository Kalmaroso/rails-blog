module ApplicationHelper

  private
    def vote_counter(votable_instance)
      if votable_instance.votes.empty?
        0
      else
        votable_instance.votes.map(&:value).inject(:+)
      end
    end

    def sort_by_votes(votable_instance_array)
      votable_instance_array.sort_by{|instance| vote_counter(instance)}.reverse
    end

    def user_vote(votable_instance)
      Vote.find_by(user_id: votable_instance.votes.map(&:user_id).detect{|id| id == current_user_id})
    end

    def vote?(votable_instance, value)
      vote = user_vote(votable_instance)
      if vote != nil && vote.value == value
        true
      else
        false
      end
    end

    def current_user
      @_current_user ||= session[:current_user_id] &&
      User.find_by(id: session[:current_user_id])
    end

    def current_user_id
      session[:current_user_id]
    end

    def user?
      if current_user_id != nil
        true
      else
        false
      end
    end
end
