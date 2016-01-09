class User < ActiveRecord::Base
  # see: https://github.com/plataformatec/devise
  devise :database_authenticatable, :registerable, :lockable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :follows
  has_many :image_links
  has_many :text_posts
  has_many :likes

  
  validates :name, :presence => true, length: { maximum: 15, too_long: "%{count} characters max for your name please!" }
  validates :name, format: { with: /\A[a-zA-Z0-9]+\Z/, message: "no spaces please" }
  validates :username, :presence => true, :uniqueness => true, length: {maximum: 15, too_long: "%{count} characters max for your awesome handle."}
  validates :bio, length: { maximum: 115, too_long: "%{count} characters is enough dude!" }
  
  # Scope method to get all users except the one passed.
  #
  def self.all_except(user)
    User.where(arel_table[:id].not_eq(user.id)).order(:name)
  end



#paperclip gem storing avatar images
  has_attached_file :avatar, 

        :path => ":rails_root/public/system/:attachment/:id/:basename_:style.:extension",
        :url => "/system/:attachment/:id/:basename_:style.:extension",
        :styles => {
          :thumb    => ['100x100#',  :jpg, :quality => 70],
         :preview  => ['480x480#',  :jpg, :quality => 70],
         :large    => ['600>',      :jpg, :quality => 70],
         :retina   => ['1200>',     :jpg, :quality => 30]
},
        :convert_options => {
         :thumb    => '-set colorspace sRGB -strip',
         :preview  => '-set colorspace sRGB -strip',
         :large    => '-set colorspace sRGB -strip',
         :retina   => '-set colorspace sRGB -strip -sharpen 0x0.5'
}


validates_attachment :avatar,
    :presence => true, message: 'No file selected!',
    :size => { :in => 0..10.megabytes },
    :content_type => { :content_type => /^image\/(jpeg|png|gif|tiff)$/ }

  
 

  



  validates :name,
    :presence => true,
    :uniqueness => true







end
