class Book < ApplicationRecord

	# Userを１とした時Nの関係を結ぶための　子供側の宣言
	belongs_to :user
	has_many :favorites, dependent: :destroy
	has_many :book_comments, dependent: :destroy
	# バリデーション：カラム名、　値がプレゼンスならOK
	validates :title, presence: true
	# バリデーション：カラム名、　値がプレゼンスならOｋ、長くても２００文字まで
	validates :body, presence: true, length: {maximum: 200}

	# favoritesテーブルのなかに、current_userのidが入ってる？
	# つまり、「いいね」した情報が入っているかどうか。
	def favorited_by?(current_user)
		favorites.where(user_id: current_user.id).exists?
	end
end
