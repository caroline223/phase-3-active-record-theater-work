class Role < ActiveRecord::Base
    has_many :auditions

    def actors
        self.auditions.map{|audition| audition.actor}
    end

    def locations
        self.auditions.map{|audition| audition.location}
    end

    def lead
        audition = self.auditions.detect{|audition| audition.hired}
        unless audition
            return "no actor has been hired for this role"
        end
        audition
    end

    def understudy
        understudy = self.auditions.where("hired = true").second
        unless understudy
            return "no actor has been hired for understudy for this role"
        end
        understudy
    end


end


