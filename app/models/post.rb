class Post < ApplicationRecord

    validates :title, presence: true 
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: ["Fiction", "Non-Fiction"]}
    validate :title_is_clickbait

    def title_is_clickbait
        # self.title.include?("Won't believe" "Secret" "Top" "Guess")
        errors.add(:title, "must include clickbait") unless self.title.include? "Won't Believe"
        # self.title["Won't believe", "Secret", "Top", "Guess"]
        # self.title["Won't believe"]
    end

end
